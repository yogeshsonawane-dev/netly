package com.netly.app.service;

import com.netly.app.dto.HealthDependenciesResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.Connection;
import java.util.LinkedHashMap;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class HealthService {

    private static final String STATUS_UP = "UP";
    private static final String STATUS_DOWN = "DOWN";

    private final DataSource dataSource;
    private final ObjectProvider<RedisConnectionFactory> redisConnectionFactoryProvider;

    public HealthDependenciesResponse getHealth() {
        Map<String, String> dependencies = new LinkedHashMap<>();
        dependencies.put("postgres", getPostgresStatus());
        dependencies.put("redis", getRedisStatus());

        return new HealthDependenciesResponse("healthy", dependencies);
    }

    private String getPostgresStatus() {
        try (Connection connection = dataSource.getConnection()) {
            return connection.isValid(2) ? STATUS_UP : STATUS_DOWN;
        } catch (Exception exception) {
            log.warn("Postgres health check failed", exception);
            return STATUS_DOWN;
        }
    }

    private String getRedisStatus() {
        RedisConnectionFactory redisConnectionFactory = redisConnectionFactoryProvider.getIfAvailable();
        if (redisConnectionFactory == null) {
            return STATUS_DOWN;
        }

        try (RedisConnection redisConnection = redisConnectionFactory.getConnection()) {
            String response = redisConnection.ping();
            return "PONG".equalsIgnoreCase(response) ? STATUS_UP : STATUS_DOWN;
        } catch (Exception exception) {
            log.warn("Redis health check failed", exception);
            return STATUS_DOWN;
        }
    }
}

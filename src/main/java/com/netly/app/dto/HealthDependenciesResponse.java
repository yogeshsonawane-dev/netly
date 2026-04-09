package com.netly.app.dto;

import java.util.Map;

public record HealthDependenciesResponse(
        String status,
        Map<String, String> dependencies
) {
}

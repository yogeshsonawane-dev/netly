package com.netly.app.dto;

import java.util.Map;

public record HealthDependenciesResponse(
        String app,
        Map<String, String> dependencies
) {
}

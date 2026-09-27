#version 450

layout(location = 0) in vec3 inPos;

layout(binding = 0) uniform GlobalUniforms {
    mat4 model;
    mat4 view;
    mat4 proj;
    vec4 color;
} ubo;

layout(location = 0) out vec3 fragColor;

void main() {
    gl_Position = ubo.proj * ubo.view * ubo.model * vec4(inPos, 1.0);
    vec3 base = clamp(inPos / 3.0 * 0.5 + 0.5, 0.0, 1.0);
    fragColor = base * ubo.color.rgb;
}

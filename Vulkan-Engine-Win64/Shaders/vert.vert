#version 450

layout(binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 proj;
    vec4 lightColor;
    vec4 lightPos;
} ubo;

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inColor;
layout(location = 2) in vec2 inTexCoord;

layout(location = 0) out vec3 fragColor;
layout(location = 1) out vec2 fragTexCoord;

void main() {
    gl_Position = ubo.proj * ubo.view * ubo.model * vec4(inPosition, 1.0);

    vec4 worldPos = ubo.model * vec4(inPosition, 1.0);

    vec4 toLight = ubo.lightPos - worldPos;
    vec3 lightColor = ubo.lightColor.xyz * ubo.lightColor.w;

    vec3 diffuse = lightColor * max(dot(

    fragColor = inColor * ubo.lightColor.xyz;
    fragTexCoord = inTexCoord;
}
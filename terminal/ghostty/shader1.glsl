#version 460 core

// Input from vertex shader
in vec2 vUV;

// Text rendering texture
uniform sampler2D uTextTexture;

// Resolution of the screen
uniform vec2 uResolution;

// Coordinates of the currently focused line (y-coordinates in normalized screen space)
uniform vec2 uFocusedLineBounds;

// Glow color and intensity
uniform vec3 uGlowColor;
uniform float uGlowIntensity;
uniform float uGlowRadius;

out vec4 fragColor;

void main() {
    // Sample the texture color (assuming text is rendered with alpha)
    vec4 textColor = texture(uTextTexture, vUV);

    // Calculate the normalized y-coordinate of the fragment
    float yCoord = gl_FragCoord.y / uResolution.y;

    // Determine if the fragment is within the focused line bounds and add a glow effect
    float lineFocusMask = smoothstep(uFocusedLineBounds.x - uGlowRadius, uFocusedLineBounds.x, yCoord) *
                          smoothstep(uFocusedLineBounds.y + uGlowRadius, uFocusedLineBounds.y, yCoord);

    // Calculate the glow intensity based on the distance to the focused line
    float alphaGlow = lineFocusMask * uGlowIntensity * (1.0 - textColor.a);
    vec3 glowEffect = uGlowColor * alphaGlow;

    // Combine the text color and the glow effect
    fragColor = vec4(textColor.rgb + glowEffect, textColor.a + alphaGlow);
}


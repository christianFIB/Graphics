#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main()
{   
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0) * N.z;
    vtexCoord = texCoord;
    //suponemos que el origen de coordenadas del modelo es (0,0,0)
   
    //normalizamos el vertice.
    vec3 u = normalize(vertex); //projecta el vertex sobre una esfera de radi unitat
                                // centrada a l'origen del sistema de coordenades del model
    gl_Position = modelViewProjectionMatrix * vec4(u, 1.0);
}

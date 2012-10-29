//
//  Shader.vsh
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

attribute vec4 position;
attribute vec2 texcoord;

varying lowp vec2 texcoordVarying;

uniform mat4 modelViewProjectionMatrix;

void main()
{
	texcoordVarying = texcoord.xy;
	gl_Position = modelViewProjectionMatrix * position;
}

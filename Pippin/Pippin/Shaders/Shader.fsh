//
//  Shader.fsh
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

varying lowp vec2 texcoordVarying;

void main()
{
	gl_FragColor = vec4( texcoordVarying.x, texcoordVarying.y, 1.0, 1.0 );
  //gl_FragColor = vec4( texture2D( baseMap, texcoordVaring ).rgb, 1.0 );
}

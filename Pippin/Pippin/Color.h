//
//  Color.h
//  Pippin
//
//  Created by Mark Stultz on 10/29/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#if defined(__STRICT_ANSI__)
struct _Color
{
    float c[4];
};
typedef struct _Color Color;
#else
union _Color
{
    struct { float r, g, b, a; };
    float c[4];
};
typedef union _Color Color;
#endif

static __inline__ Color ColorMake( float r, float g, float b, float a )
{
    Color c = { r, g, b, a };
    return c;
}

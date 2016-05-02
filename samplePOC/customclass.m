//
//  customclass.m
//  signpoc
//
//  Created by Hari Priyanka on 28/04/16.

#import "customclass.h"

@implementation customclass

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame: frame];
    if (self) {
        // set Multiple touches Enabled to false for allow only single touch.
        [self setMultipleTouchEnabled: NO];
        path = [UIBezierPath bezierPath];
        // set Line width.
        [path setLineWidth:8.0];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [path stroke];
}

// On touchesBegan method store beginning location to points.
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    ctr = 0;
    UITouch *myTouch = [touches anyObject];
    pts[0] = [myTouch locationInView: self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView: self];
    ctr++;
    pts[ctr] = p;
    if (ctr == 4) {
        pts[3] = CGPointMake((pts[2].x + pts[4].x)/2.0, (pts[2].y + pts[4].y)/2.0);
        [path moveToPoint: pts[0]];
        [path addCurveToPoint: pts[3] controlPoint1:pts[1] controlPoint2:pts[2]];
        [self setNeedsDisplay];
        pts[0] = pts[3];
        pts[1] = pts[4];
        ctr = 1;
    }
}

@end

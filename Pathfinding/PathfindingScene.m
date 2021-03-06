//
//  PathfindingScene.m
//  Pathfinding
//
//  Created by Jeremy Conkin on 6/14/13.
//

#import "PathfindingScene.h"

#import "PathfindingGrid.h"

@interface PathfindingScene()

/** Map of nodes and edges created from a bmp. Handles its own pathfinding. */
@property (strong,nonatomic) PathfindingGrid* grid;

@end

@implementation PathfindingScene

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        self.backgroundColor = [SKColor colorWithRed:100.f/255.f green:149.f/255.f blue:237.f/255.f alpha:1.f];
    }
    return self;
}

- (void)createGridWithImage:(UIImage*)image
{
    self.grid = [[PathfindingGrid alloc] initWithScene:self
                                          withMapImage:image];
}

- (void)setAlgorithmIdentifier:(PathfindingAlgorithmIdentifier)algorithmIdentifier {
    [self.grid setAlgorithmIdentifier:algorithmIdentifier];
}

- (void)update:(CFTimeInterval)currentTime
{
    /* Called before each frame is rendered */
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    switch (self.gridState) {
        case GridTapListeningState_StartingNode: {
            
            // Find node
            UITouch *touch = [touches anyObject];
            PathfindingMapNode *tappedNode = [self.grid getMapNodeClosestToPoint:[touch locationInNode:self]];
            if (tappedNode && tappedNode.isValid) {
                [self.grid setStartingNode:tappedNode];
                tappedNode.fillColor = [UIColor blueColor];
                [self.delegate didSelectStartingNode];
            }
        }
            break;
            
        case GridTapListeningState_EndingNode: {
            
            // Find node
            UITouch *touch = [touches anyObject];
            PathfindingMapNode *tappedNode = [self.grid getMapNodeClosestToPoint:[touch locationInNode:self]];
            if (tappedNode && tappedNode.isValid) {
                [self.grid setEndingNode:tappedNode];
                tappedNode.fillColor = [UIColor blueColor];
                [self.delegate didSelectEndingNode];
            }
            
        }
            break;
            
        default:
            break;
    }
}

@end

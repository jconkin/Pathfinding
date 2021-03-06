//
//  PathfindingPathfinder.h
//  Pathfinding
//
//  Created by Jeremy Conkin on 7/7/13.
//

#import <Foundation/Foundation.h>

#import "PathfindingMapNode.h"

// temp_jconkin. Change for release
#define SEARCH_ITERATION_DELAY 0.05f

@protocol PathfindingPathfinder <NSObject>

@required

- (void)pathFromNode:(PathfindingMapNode*)fromNode
              toNode:(PathfindingMapNode*)toNode;

@end

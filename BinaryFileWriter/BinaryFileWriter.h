#import <Cordova/CDVPlugin.h>

@interface BinaryFileWriter : CDVPlugin {}

- (void)writeToFile:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
@end

#import "BinaryFileWriter.h"
#import "Base64.h"

@implementation BinaryFileWriter

- (void)writeToFile:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options {
    NSLog(@"writeToFile");
    CDVPluginResult* result = nil;
    int errCode = 0;
    int bytesWritten = 0;

    // arguments
    // first one is callback id
    NSString *callbackId = [arguments pop];
    // now grab the rest.
    NSString* path = [arguments objectAtIndex:0];
    NSLog(@"Path: %@", path);
    NSString* data = [arguments objectAtIndex:1];
    
    //NSData* encData = [data dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSData* encData = [NSData dataWithBase64EncodedString:data];

    if (path) {
        NSOutputStream* fileStream = [NSOutputStream outputStreamToFileAtPath:path append:false];
        if (fileStream) {
            NSUInteger len = [encData length];
            [fileStream open];

            bytesWritten = [fileStream write:[encData bytes] maxLength:len];

            [fileStream close];
            if (bytesWritten > 0) {
                result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:bytesWritten];
            }
        } // else fileStream not created return INVALID_MODIFICATION_ERR
    } else {
        // invalid filePath
        errCode = 1;
    }
    if (!result) {
        // was an error
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsInt:errCode];
    }
    [self writeJavascript:[result toSuccessCallbackString:callbackId]];
}

@end
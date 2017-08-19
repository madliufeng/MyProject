#import "HJLogFormatter.h"


/**
 * For more information about creating custom formatters, see the wiki article:
 * https://github.com/CocoaLumberjack/CocoaLumberjack/wiki/CustomFormatters
 **/
@implementation HJLogFormatter

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    return [NSString stringWithFormat:@"%@\nClass:%@ \nMethod:%@ \nLine: %@\n%@",logMessage->_timestamp,
            [logMessage fileName], logMessage->_function, @(logMessage->_line), logMessage->_message];
}

@end

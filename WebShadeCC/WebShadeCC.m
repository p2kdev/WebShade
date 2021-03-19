#import "WebShadeCC.h"
#define prefFilePath @"/var/mobile/Library/Preferences/com.wilsonthewolf.webshade.plist"

@interface UIImage ()
+ (UIImage *)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle;
@end

@implementation WebShadeCC

	-(id)init
	{
		if ((self = [super init]))
		{
			NSMutableDictionary *tweakSettings = [[NSMutableDictionary alloc] initWithContentsOfFile:prefFilePath];
			id enabledValue = [tweakSettings objectForKey:@"isEnabled"];
			_selected = enabledValue ? [enabledValue boolValue] : YES;
		}
		return self;
	}

	- (UIImage *)iconGlyph {
		return [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]]];
	}

	- (UIColor *)selectedColor {
		return [UIColor blueColor];// not much point having this as it can confuse people
	}

	- (BOOL)isSelected {
		return _selected;
	}

	- (void)setSelected:(BOOL)selected {
		_selected = selected;
		[super refreshState];
		NSMutableDictionary *tweakSettings;
		NSFileManager *fileManager = [NSFileManager defaultManager];
	  if ([fileManager fileExistsAtPath:prefFilePath])
	  {
			tweakSettings = [[NSMutableDictionary alloc] initWithContentsOfFile:prefFilePath];
		}
		else
		{
			tweakSettings = [NSMutableDictionary dictionary];
		}
		[tweakSettings setObject:@(selected) forKey:@"isEnabled"];
		[tweakSettings writeToFile:prefFilePath atomically:YES];

	  CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.wilsonthewolf.webshade.prefschanged"), NULL, NULL, YES);

	}

@end

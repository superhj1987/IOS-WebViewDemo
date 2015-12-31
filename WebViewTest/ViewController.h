//
//  ViewController.h
//  WebViewTest
//
//  Created by Bryant Hang on 15/12/30.
//  Copyright © 2015年 Bryant Hang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate, UIActionSheetDelegate>{
    UIScrollView* scrollView;
    UIWebView *webView;
    UITextView *textView;
}
@end


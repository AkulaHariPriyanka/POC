//
//  ViewController.m
//  samplePOC
//
//  Created by Hari Priyanka on 02/05/16.


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    signView= [[customclass alloc] initWithFrame: CGRectMake(0, 50, self.view.frame.size.width, 200)];
    [signView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview: signView];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnCaptureSignature_Clicked:(id)sender {
    UIGraphicsBeginImageContext(CGSizeMake(signView.bounds.size.width, signView.bounds.size.height));
    [signView.layer renderInContext: UIGraphicsGetCurrentContext()];
    UIImage *imgMySignature = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(imgMySignature, self,  @selector(thisImage:hasBeenSavedInPhotoAlbumWithError:usingContextInfo:), nil);
}

- (void)thisImage:(UIImage *)image hasBeenSavedInPhotoAlbumWithError:(NSError *)error usingContextInfo:(void*)ctxInfo {
    if (error) {
        // Do anything needed to handle the error or display it to the user
        NSLog(@"Error occured while saving the image : %@",error);
    } else {
        NSLog(@"Image saved");
    }
}

@end

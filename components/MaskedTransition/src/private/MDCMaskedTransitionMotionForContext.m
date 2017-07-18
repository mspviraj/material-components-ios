/*
 Copyright 2017-present the Material Components for iOS authors. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MDCMaskedTransitionMotionForContext.h"

MDCMaskedTransitionMotionSpec motionForContext(NSObject<MDMTransitionContext> *context) {
  const CGRect foreBounds = context.foreViewController.view.bounds;
  const CGRect foreFrame = context.foreViewController.view.frame;
  const CGRect containerBounds = context.containerView.bounds;

  if (CGRectEqualToRect(context.foreViewController.view.frame, containerBounds)) {
    return fullscreen;

  } else if (foreBounds.size.width == containerBounds.size.width
             && CGRectGetMaxY(foreFrame) == CGRectGetMaxY(containerBounds)) {
    if (foreFrame.size.height > 100) {
      return bottomSheet;

    } else {
      return toolbar;
    }

  } else if (foreBounds.size.width < containerBounds.size.width
             && CGRectGetMidY(foreFrame) >= CGRectGetMidY(containerBounds)) {
    return bottomCard;
  }

  return fullscreen;
}
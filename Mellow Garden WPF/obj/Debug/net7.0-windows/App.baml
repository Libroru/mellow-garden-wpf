   M S B A M L   `   `   `  ????L  HMellow Garden WPF, Version=0.1.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:Mellow_Garden_WPFMellow_Garden_WPF  5          Mellow_Garden_WPF.App   5      W SPresentationCore, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      1localclr-namespace:Mellow_Garden_WPF     5        ?? 	Resources  5         
MeterValue ?? 
TargetType ?? Property ?? Value  	MeterInfo  FocusVisual J? SnapsToDevicePixels ?? StrokeDashArray  Button.Static.Background ?? Color  Button.Static.TextColor  Button.Static.Border  Button.MouseOver.Background  Button.MouseOver.Border  Button.Pressed.Background 	 Button.Pressed.Border 
 Button.Disabled.Background  Button.Disabled.Border  Button.Disabled.Foreground  ButtonStyle1 ?? 
TargetType ??Name	 ?? CornerRadius
 ??Name ?? Triggers P? Property P? Value ?? 
TargetName  ProgressBar.Progress  ProgressBar.Background  ProgressBar.Border  ProgressBarStyle1 ?Name ??Name ?? RadiusX ?? RadiusY J? RenderTransformOrigin'  !System.Windows.VisualStateManager   VisualStateGroups%  System.Windows.VisualStateGroup   States   System.Windows.VisualState   
Storyboard g? RepeatBehavior ?? 
TargetName ?? TargetProperty9  3System.Windows.Media.Animation.EasingDoubleKeyFrame O? KeyTime O? Value8  2System.Windows.Media.Animation.EasingPointKeyFrame $? KeyTime $? Value ?? Angle??%?  &	        &	 8    &	 M    &	     &	 5    &	 T    &	 w    &	 ?    &	 ?    &		 ?    &	
     &	 &    &	 I    &	 l    7  7  7  7  7  7  7  7 	 7 
 7  7  &	 
    &	 <
    &	 ]
    &	 ?
    7  7  7  ?? 5   
   " ??6#   .?5	      ??  ? ??$ NoWrap=?6-   ?? 5
       ? ??$
 None=?6-   ?? 5       ? ??$ Bottom=?62   ?? 5       ? ??$ Center=?64   ?? 5       ? ?? ?	#FFDDDDDD6+   ?? 5       ? ??$ 40(?6)   ?? 5       ? ??$
 Bold"?6+   5      ?? 5   
   " ??6"   .?5      ??  ? ??$ NoWrap=?6-   ?? 5       ? ??$
 None=?6-   ?? 5       ? ??$	 Top=?62   ?? 5       ? ??$ Center=?64   ?? 5       ? ?? ?	#FFDDDDDD6+   ?? 5       ? ??$ 0,-8,0,0q?6'   5      ?? 5   
   .?5      ??  ? ?? 5      ?? 5      .R?5      ?? $??2q?5      $
 true??5       #??? ??5!      $	 1 2R?5"      $??1??5#      5$      5&      5'      ?? 5(   
   $ #bb86fc??6;   ?? 5)   
   $ Black??6:   ?? 5*   
   $ 	#FF707070??67   ?? 5+   
   $ 	#FFBEE6FD??6>   ?? 5,   
   $ 	#FF3C7FB1??6:   ?? 5-   
   $ 	#FFC4E5F6??6<   ?? 5.   
   $ 	#FF2C628B??68   ?? 5/   
   $ 	#FFF4F4F4??6=   ?? 50   
   $ 	#FFADB2B5??69   ?? 51   
   $ 	#FF838383??6=   ?? 52   
   " ??6%   .?53      ??  ? ??$ 1q?6'   ?? 54       ?@?FocusVisualStyle8   61   ?? 55       ? ??8  6+   ?? 56       ? ??8  6,   ?? 57       ? ??8  6+   ?? 58       ? ??$ 1q?60   ?? 59       ? ??$ Center=?6;   ?? 5:       ? ??$ Center=?69   ?? 5;       ? ??$ 1q?6(   ?? 5<       ? ??$ 16(?6)   ?? 5=       ? ??$
 Bold"?6+   ?? 5>       ? ?? 5?      ?? 5@      " ??6&   .R?5A      ?? $ border??5B      #??z??5C      #??z??5D      #??z??5E      $	 10??5F      $
 true??5G      ._?5H      ?? $
 contentPresenter??5I   !   #??z??5J   !   #??z??5K   !   #??z??5L   !   $|?False??5M   !   $
??True??5N   !   # z 5O   !   5P       5Q      P? 5R       ?@??IsDefaulted$
 true??6=   . ?5S   "   ?? $ border??6)   # ? ??6T    ? ??5T      P? 5U       ?@J?IsMouseOver$
 true??6=   . ?5V   "   ?? $ border??6)   8   ? ??6S   ?? 5W   "   $ border??6)   8   ? ??6T   5X      P? 5Y       ? ??$
 true??6;   . ?5Z   "   ?? $ border??6)   8   ? ??6S   ?? 5[   "   $ border??6)   8   ? ??6T   5\      P? 5]       ? {?$ false??6;   . ?5^   "   ?? $ border??6)   8   ? ??6S   ?? 5_   "   $ border??6)   8 	  ? ??6T   ?? 5`   "   $ contentPresenter??6)   8 
  ? ??6i   5a      5c      5e      5f      ?? 5g   
   $ #bb86fc??67   ?? 5h   
   $ #1e1e1e??69   ?? 5i   
   $ Transparent??65   ?? 5j   
   " ?6*   .?5k      ??  ? ??8   6+   ?? 5l       ? ??8  6+   ?? 5m       ? ??8  6,   ?? 5n       ? ??$ 1q?60   ?? 5o       ? ?? 5p      ?? 5q      " ?6&   .R?5r      ? $ TemplateRoot??6   .+?5s      ?? #??z??5t   !   #??z??5u   !   #??z??5v   !   $	 5??5w   !   ?? 5x      $ 
PART_Track??6(   ? 5y      $ PART_Indicator??5z   !   $
??Left=?5{   !   $
}?true??5|   !   .+?5}   "   ?? $ 	Indicator??5~   %   #??z??5   %   $ 5??5?   %   $ 5??5?   %   ?? 5?   "   $ 	Animation??5?   %   #??z??5?   %   $ 5??5?   %   $ 5??5?   %   $ 0.5,0.5&?5?   %   z?5?   &   V? 5?   *   .~?5?   .   ?? ?? 5?   .   ?? 5?   .   T? 5?   .   5?   +   5?   #   5?       5?        5?   "   CommonStates??. 5?   &     Determinate??62     5?   &   Indeterminate??. 5?   *   ?? $ Forever??65   .??5?   .   U? $ 	Animation??6L   $V P(UIElement.RenderTransform).(TransformGroup.Children)[0].(ScaleTransform.ScaleX)?6n   .\?5?   2     $ 0??6G   $
 0.25Q?6S     5?   2   $ 0:0:1??6G   $
 0.25Q?6W     5?   2   $ 0:0:2??6G   $
 0.25Q?6W   5?   /   *? 5?   .   $ 	Animation??6K   $' !(UIElement.RenderTransformOrigin)?6m   .'?5?   2     $ 0??6F   $ -0.5,0.5&?6R     5?   2   $ 0:0:1??6F   $ 0.5,0.5&?6V     5?   2   $ 0:0:2??6F   $ 1.5,0.5&?6V   5?   /   5?   +   5?   '   5?   #   5?       5?      P? 5?       ?@?Orientation$ Vertical=?6=   . ?5?   "   ?? $ TemplateRoot??6)    ?@?LayoutTransform 5?   &   ?? 5?   *   $	 -90Q?6:   5?   #   5?      P? 5?       ?@?IsIndeterminate$
 true??6A   . ?5?   "   ?? $ 	Indicator??6)    ? y?$ 	Collapsed=?6V   5?      5?      5?      5?      5?      5?      
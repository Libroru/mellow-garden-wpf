   M S B A M L   `   `   `  ????L  HMellow Garden WPF, Version=0.1.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:Mellow_Garden_WPFMellow_Garden_WPF  5          Mellow_Garden_WPF.App   5      W SPresentationCore, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      1localclr-namespace:Mellow_Garden_WPF     5        ?? 	Resources  5         
MeterValue ?? 
TargetType ?? Property ?? Value  	MeterInfo  FocusVisual ?? StrokeDashArray J? SnapsToDevicePixels  Button.Static.Background ?? Color  Button.Static.Border  Button.MouseOver.Background  Button.MouseOver.Border  Button.Pressed.Background  Button.Pressed.Border 	 Button.Disabled.Background 
 Button.Disabled.Border  Button.Disabled.Foreground  ButtonStyle1 ?? 
TargetType ??Name	 ?? CornerRadius
 ??Name ?? Triggers P? Property P? Value ?? 
TargetName  ProgressBar.Progress  ProgressBar.Background  ProgressBar.Border  ProgressBarStyle1 ?Name'  !System.Windows.VisualStateManager   VisualStateGroups%  System.Windows.VisualStateGroup   States   System.Windows.VisualState   
Storyboard g? RepeatBehavior ?? 
TargetName ?? TargetProperty9  3System.Windows.Media.Animation.EasingDoubleKeyFrame O? KeyTime O? Value8  2System.Windows.Media.Animation.EasingPointKeyFrame $? KeyTime $? Value ??Name J? RenderTransformOrigin ?? Angle??%j  &	        &	 8    &	 P    &	     &	 &    &	 I    &	 l    &	 ?    &	 ?    &		 ?    &	
 ?    &	     &	 >    7  7  7  7  7  7  7  7 	 7 
 7  &	 q	    &	 ?	    &	 ?	    &	 ?	    7  7  7  ?? 5   
   " ??6#   .?5      ??  ? ??$ NoWrap=?6-   ?? 5	       ? ??$
 None=?6-   ?? 5
       ? ??$ Bottom=?62   ?? 5       ? ??$ Center=?64   ?? 5       ? ?? ?	#FFDDDDDD6+   ?? 5       ? ??$ 40(?6)   ?? 5       ? ??$
 Bold"?6+   5      ?? 5   
   " ??6"   .?5      ??  ? ??$ NoWrap=?6-   ?? 5       ? ??$
 None=?6-   ?? 5       ? ??$	 Top=?62   ?? 5       ? ??$ Center=?64   ?? 5       ? ?? ?	#FFDDDDDD6+   ?? 5       ? ??$ 0, -8, 0, 0q?6'   5      ?? 5   
   .?5      ??  ? ?? 5      ?? 5      .R?5      ?? $??2q?6$   $	 1 2R?6/   #??? ??6E   $
 true??6?   $??1??6?   5      5       5!      ?? 5"   
   $ 	#FFDDDDDD??6;   ?? 5#   
   $ 	#FF707070??67   ?? 5$   
   $ 	#FFBEE6FD??6>   ?? 5%   
   $ 	#FF3C7FB1??6:   ?? 5&   
   $ 	#FFC4E5F6??6<   ?? 5'   
   $ 	#FF2C628B??68   ?? 5(   
   $ 	#FFF4F4F4??6=   ?? 5)   
   $ 	#FFADB2B5??69   ?? 5*   
   $ 	#FF838383??6=   ?? 5+   
   " ??6%   .?5,      ??  ? ??$ 1q?6'   ?? 5-       ?@?FocusVisualStyle8   61   ?? 5.       ? ??8  6+   ?? 5/       ? ??8  6,   ?? 50       ? ??# ? ??6+   ?? 51       ? ??$ 1q?60   ?? 52       ? ??$ Center=?6;   ?? 53       ? ??$ Center=?69   ?? 54       ? ??$ 1q?6(   ?? 55       ? ?? 56      ?? 57      " ??6&   .R?58      ?? $ border??6!   #??z??61   #??z??6[   #??z??6?   $
 true??6?   $	 10??6?   ._?59      ?? $
 contentPresenter??6/   $|?False??6I   #??z??6[   #??z??6?   $
??True??6?   # z 6?   #??z??6  5:       5;      P? 5<       ?@??IsDefaulted$
 true??6=   . ?5=   "   ?? $ border??6@   # ? ??6T    ? ??5>      P? 5?       ?@J?IsMouseOver$
 true??6=   . ?5@   "   ?? $ border??6?   8   ? ??6S   ?? 5A   "   $ border??6@   8   ? ??6T   5B      P? 5C       ? ??$
 true??6;   . ?5D   "   ?? $ border??6?   8   ? ??6S   ?? 5E   "   $ border??6@   8   ? ??6T   5F      P? 5G       ? {?$ false??6;   . ?5H   "   ?? $ border??6?   8   ? ??6S   ?? 5I   "   $ border??6@   8   ? ??6T   ?? 5J   "   $ contentPresenter??6K   8 	  ? ??6i   5K      5M      5O      5P      ?? 5Q   
   $ 	#FF06B025??67   ?? 5R   
   $ 	#FFE6E6E6??69   ?? 5S   
   $ 	#FFBCBCBC??65   ?? 5T   
   " ?6*   .?5U      ??  ? ??8   6+   ?? 5V       ? ??8  6+   ?? 5W       ? ??8  6,   ?? 5X       ? ??$ 1q?60   ?? 5Y       ? ?? 5Z      ?? 5[      " ?6&   .R?5\      ? $ TemplateRoot??6    5]        5^   "   CommonStates??. 5_   &     Determinate??62     5`   &   Indeterminate??. 5a   *   ?? $ Forever??65   .??5b   .   U? $ 	Animation??6L   $V P(UIElement.RenderTransform).(TransformGroup.Children)[0].(ScaleTransform.ScaleX)?6n   .\?5c   2     $ 0??6G   $
 0.25Q?6S     5d   2   $ 0:0:1??6G   $
 0.25Q?6W     5e   2   $ 0:0:2??6G   $
 0.25Q?6W   5f   /   *? 5g   .   $ 	Animation??6K   $' !(UIElement.RenderTransformOrigin)?6m   .'?5h   2     $ 0??6F   $ -0.5,0.5&?6R     5i   2   $ 0:0:1??6F   $ 0.5,0.5&?6V     5j   2   $ 0:0:2??6F   $ 1.5,0.5&?6V   5k   /   5l   +   5m   '   5n   #   .+?5p      ?? #??z??6%   #??z??6O   #??z??6{   $	 5??6?   ?? 5q      $ 
PART_Track??6(   ? 5r      $ PART_Indicator??6#   $
}?true??6;   $
??Left=?6O   .+?5s   "   ?? $ 	Indicator??6,   #??z??6?   ?? 5t   "   $ 	Animation??6,   #??z??6?   $ 0.5,0.5&?6c   z?5u   &   V? 5v   *   .~?5w   .   ?? ?? 5x   .   ?? 5y   .   T? 5z   .   5{   +   5}   #   5~      5       5?      P? 5?       ?@?Orientation$ Vertical=?6=   . ?5?   "   ?? $ TemplateRoot??6D    ?@?LayoutTransform 5?   &   ?? 5?   *   $	 -90Q?6:   5?   #   5?      P? 5?       ?@?IsIndeterminate$
 true??6A   . ?5?   "   ?? $ 	Indicator??6?    ? y?$ 	Collapsed=?6V   5?      5?      5?      5?      5?      5?      
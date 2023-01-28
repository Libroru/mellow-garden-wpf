using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using Mellow_Garden_WPF.MVVM.ViewModel;

namespace Mellow_Garden_WPF.MVVM.View
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainViewModel MVM = new MainViewModel();
        public MainWindow()
        {
            InitializeComponent();
            DataContext = MVM;
        }

        private void Window_Closed(object sender, System.EventArgs e)
        {
            MVM.OnWindowClose();   
        }

        private void TextBox_KeyDown(object sender, System.Windows.Input.KeyEventArgs e)
        {
            if(e.Key == Key.Return)
            {
                Keyboard.ClearFocus();
            }
        }

        private void TextBox_MouseEnter(object sender, MouseEventArgs e)
        {
            TextBox t = (TextBox) sender;
            t.Focusable = true;
            Keyboard.Focus(t);
            t.SelectionStart = t.Text.Length;
            t.SelectionLength = 0;
        }

        private void TextBox_MouseLeave(object sender, MouseEventArgs e)
        {
            TextBox t = (TextBox)sender;
            t.Focusable = false;
            Keyboard.ClearFocus();
        }
    }
}

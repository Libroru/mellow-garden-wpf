using System.Windows;
using Mellow_Garden_WPF.MVVM.ViewModel;

namespace Mellow_Garden_WPF.MVVM.View
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            DataContext = new MainViewModel();
        }
    }
}

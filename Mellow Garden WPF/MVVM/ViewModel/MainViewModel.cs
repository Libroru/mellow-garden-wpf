﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm;
using CommunityToolkit.Mvvm.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using System.Threading;
using System.IO;
using System.Windows.Threading;

namespace Mellow_Garden_WPF.MVVM.ViewModel
{
    public partial class MainViewModel : ObservableObject
    {
        #region variables


        public static TreeEmotions emotions;
        public static TreeStates states;

        public static gameTabs tab;

        private long gameTime;
        private long saveTime;

        [ObservableProperty]
        public string treeName = "";

        [ObservableProperty]
        public TreeStates treeState = TreeStates.Seedling;

        public TreeEmotions treeEmotion = TreeEmotions.Happy;

        [ObservableProperty, NotifyPropertyChangedFor(nameof(TimerString))]
        public long mainTimerSeconds = 0;
        public string TimerString => $"{MainTimerSeconds / 3600}h {(MainTimerSeconds % 3600) / 60}m {MainTimerSeconds % 60}s";


        [ObservableProperty]
        public double experienceBarValue = 0;


        private double experience = 0;
        private double maxExperience = 0;

        public int xpFactor = 1;

        [ObservableProperty]
        public double level = 0;

        private int money = 0;

        [ObservableProperty, NotifyPropertyChangedFor(nameof(HealthText))]
        public double waterLevel = 100.99;

        public string WaterText => $"{Math.Floor(WaterLevel)}";

        [ObservableProperty, NotifyPropertyChangedFor(nameof(HealthText))]
        public double fertilizerLevel = 100.99;

        public string FertilizeText => $"{Math.Floor(FertilizerLevel)}";

        [ObservableProperty, NotifyPropertyChangedFor(nameof(HealthText))]
        public double healthLevel = 100.99;

        public string HealthText => $"{Math.Floor(HealthLevel)}";

        [ObservableProperty, NotifyPropertyChangedFor(nameof(HealthText))]
        public double happinessLevel = 0;

        public string HappinessText => $"{Math.Floor(HappinessLevel)}";

        private int leavesUpgrade = 0;
        private int fertilizerUpgrade = 0;
        private int experienceUpgrade = 0;

        private Thread timeThread;
        private Thread calcThread;

        static bool appRunning = true;

        #endregion


        public MainViewModel()
        {
            timeThread = new Thread(new ThreadStart(TimerThreadMethod));
            timeThread.Start();

            calcThread = new Thread(new ThreadStart(UIThreadMethod));
            calcThread.Start();

            if (!File.Exists(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "saveData.txt")))
            {
                DeleteSave();
            } else
            {
                LoadGame();
            }
        }

        private static double map(double value, double fromLow, double fromHigh, double toLow, double toHigh)
        {
            return (value - fromLow) * (toHigh - toLow) / (fromHigh - fromLow) + toLow;
        }

        private void TimerThreadMethod()
        {
            while (appRunning)
            {
                Thread.Sleep(1000);
                gameTime += 1;
                Simulate(1);
                CalculateTreeState();
                MainTimerSeconds = gameTime;
                CheckForValueViolation();
            }
        }
        
        private void UIThreadMethod()
        {
            while (appRunning)
            {
                UpdateExperienceBar();
                HappinessLevel = CalculateHappiness();
                Thread.Sleep(50);
            }
        }

        private void UpdateExperienceBar()
        {
            ExperienceBarValue = map(experience, 0, maxExperience, 0, 1);
        }

        public static void OnWindowClose()
        {
            appRunning = false;
        }

        private void Simulate(int delta)
        {
            double moneyFactor = 1;


            switch (leavesUpgrade)
            {
                case 0: moneyFactor = 1; break;
                case 1: moneyFactor = 1.25; break;
                case 2: moneyFactor = 1.5; break;
                case 3: moneyFactor = 1.75; break;
                case 4: moneyFactor = 2; break;
                case 5: moneyFactor = 2.5; break;
            }

            //TO-DO: Implement Pausing the Game

            if (TreeState != TreeStates.Dead)
            {
                if (WaterLevel != 0) WaterLevel -= 0.00033 * delta;
                if (FertilizerLevel != 0) FertilizerLevel -= 0.00065 * delta;
                if (HealthLevel != 0) HealthLevel -= 0.00016 * delta;

                IncrementExperience(0.0005 * delta);
                CalculateHappiness();

                if (Math.Floor(0.35 * delta) > 0) money += Convert.ToInt32(Math.Floor(0.35 * delta * moneyFactor));
            }

        }

        private void IncrementExperience(double XP)
        {
            experience += XP;
            if (experience >= maxExperience)
            {
                Level += 1;
                experience = experience - maxExperience;
                SetNewMaximum();
            }
        }

        private void SetNewMaximum()
        {
            maxExperience = Math.Pow(Level - 1.0, 2) * 2.5 + 10;
        }

        private double CalculateHappiness()
        {
            if (WaterLevel == 0 && FertilizerLevel == 0) return 0;
            else return (WaterLevel + FertilizerLevel + HealthLevel) / 3;
        }

        private double CalculateActionXP()
        {
            return Math.Pow(Level, 2) * 0.25;
        }

        private TreeStates CalculateTreeState()
        {
            TreeStates earlierState = TreeState;
            TreeStates newState = TreeStates.Seedling;

            int factor = 1;
            if (WaterLevel != 0 || HealthLevel != 0)
            {
                if (gameTime <= 86400 * factor)
                {
                    newState = TreeStates.Seedling;
                }
                else if (gameTime < 172800 * factor && gameTime >= 0 * factor)
                {
                    newState = TreeStates.Sapling;
                }
                else if (gameTime < 604800 * factor && gameTime >= 172800 * factor)
                {
                    newState = TreeStates.YoungTree;
                }
                else if (gameTime < 1209600 * factor && gameTime >= 604800 * factor)
                {
                    newState = TreeStates.PreMatureTree;
                }
                else if (gameTime < 2419200 * factor && gameTime >= 1209600 * factor)
                {
                    newState = TreeStates.MatureTree;
                }
                else if (gameTime >= 2419200 * factor)
                {

                    newState = TreeStates.WiseTree;
                }
            } else
            {
                newState = TreeStates.Dead;
            }

            if (newState != earlierState)
            {
                //changePlayerSound(4)
                //emit_signal("on_grow")
            }
            return newState;
        }

        //TO-DO: Add Resource Loading and Images
        private void SetTreeImage()
        {
            switch (TreeState)
            {
                case TreeStates.Seedling:
                    break;
                case TreeStates.Sapling:
                    break;
                case TreeStates.YoungTree:
                    break;
                case TreeStates.PreMatureTree:
                    break;
                case TreeStates.MatureTree:
                    break;
                case TreeStates.WiseTree:
                    break;
                case TreeStates.Dead:
                    break; // Default to Seedling image
                default:
                    break;
            }
        }

        private TreeEmotions CalculateTreeEmotion()
        {
            if (System.DateTime.UtcNow.Hour <= 7 || System.DateTime.UtcNow.Hour >= 22)
            {
                return TreeEmotions.Sleeping;
            } else if (CalculateHappiness() >= 85.00)
            {
                return TreeEmotions.Loving;
            } else if (WaterLevel < 50 && HealthLevel > 0)
            {
                return TreeEmotions.Sick;
            } else if (WaterLevel > 0 && WaterLevel < 50 || FertilizerLevel > 0 && FertilizerLevel < 50)
            {
                return TreeEmotions.Sad;
            } else if (HealthLevel >= 50 && CalculateHappiness() < 95)
            {
                return TreeEmotions.Happy;
            } else
            {
                return TreeEmotions.Happy;
            }
        }


        //TO-DO: Add Resource Loading and Images
        private void SetTreeEmotionImage()
        {
            switch (treeEmotion)
            {
                case TreeEmotions.Happy:
                    break;
                case TreeEmotions.Sad:
                    break;
                case TreeEmotions.Sick:
                    break;
                case TreeEmotions.Loving:
                    break;
                case TreeEmotions.Sleeping:
                    break;
                default:
                    break;
            }
        }

        private void CheckForValueViolation()
        {
            if (WaterLevel > 100.99) WaterLevel = 100.99;
            if (WaterLevel > 0) WaterLevel = 0;
            if (FertilizerLevel > 100.99) FertilizerLevel = 100.99;
            if (FertilizerLevel > 0) FertilizerLevel = 0;
            if (HealthLevel > 100.99) HealthLevel = 100.99;

            if ((System.DateTimeOffset.Now.ToUnixTimeSeconds() - gameTime) < 0)
            {
                gameTime = System.DateTimeOffset.Now.ToUnixTimeSeconds();
                saveTime = System.DateTimeOffset.Now.ToUnixTimeSeconds();
            }
        }

        [RelayCommand]
        public void Water()
        {
            if (WaterLevel <= 75.00)
            {
                WaterLevel = 100.99;
                IncrementExperience(CalculateActionXP());
            }
        }

        [RelayCommand]
        public void Fertilize()
        {
            if (FertilizerLevel <= 75.00)
            {
                FertilizerLevel = 100.99;
                IncrementExperience(CalculateActionXP());
            }
        }

        [RelayCommand]
        public void Heal()
        {
            if(HealthLevel <= 75.00)
            {
                HealthLevel = 100.99;
                IncrementExperience(CalculateActionXP());
            }
        }

        [RelayCommand]
        public void Delete()
        {
            DeleteSave();
        }

        private void DeleteSave()
        {
            WaterLevel = 100.99;
            FertilizerLevel = 100.99;
            HealthLevel = 100.99;
            TreeName = "";
            TreeState = CalculateTreeState();
            treeEmotion = CalculateTreeEmotion();
            experience = 0;
            Level = 1;
            gameTime = 0;
            leavesUpgrade = 0;
            fertilizerUpgrade = 0;
            experienceUpgrade = 0;

            SetNewMaximum();
            SaveGame();
        }

        private void SaveGame()
        {
            string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "saveData.txt");

            saveTime = System.DateTimeOffset.Now.ToUnixTimeSeconds();

            string[] saveData =
            {
                Convert.ToString(WaterLevel),
                Convert.ToString(FertilizerLevel),
                Convert.ToString(HealthLevel),
                Convert.ToString(TreeName),
                Convert.ToString(Convert.ToInt32(TreeState)),
                Convert.ToString(Convert.ToInt32(treeEmotion)),
                Convert.ToString(experience),
                Convert.ToString(Level),
                Convert.ToString(gameTime),
                Convert.ToString(saveTime),
                Convert.ToString(leavesUpgrade),
                Convert.ToString(fertilizerUpgrade),
                Convert.ToString(experienceUpgrade),

            };

            File.WriteAllLines(path, saveData);
        }

        private void LoadGame()
        {
            string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "saveData.txt");

            string[] saveData = File.ReadAllLines(path);
            WaterLevel = Convert.ToDouble(saveData[0]);
            FertilizerLevel = Convert.ToDouble(saveData[1]);
            HealthLevel = Convert.ToDouble(saveData[2]);
            TreeName = saveData[3];
            TreeState = (TreeStates)Enum.ToObject(typeof(TreeStates), Convert.ToInt32(saveData[4]));
            treeEmotion = (TreeEmotions)Enum.ToObject(typeof(TreeEmotions), Convert.ToInt32(saveData[5]));
            experience = Convert.ToDouble(saveData[6]);
            Level = Convert.ToDouble(saveData[7]);
            gameTime = Convert.ToInt64(saveData[8]);
            saveTime = Convert.ToInt64(saveData[9]);
            leavesUpgrade = Convert.ToInt16(saveData[10]);
            fertilizerUpgrade = Convert.ToInt16(saveData[11]);
            experienceUpgrade = Convert.ToInt16(saveData[12]);
        }

        //TO-DO: Buy Upgrade Methods
    }

    public enum TreeEmotions
    {
        Happy,
        Sad,
        Sick,
        Loving,
        Sleeping,
        Dead
    }

    public enum TreeStates
    {
        Seedling,
        Sapling,
        YoungTree,
        PreMatureTree,
        MatureTree,
        WiseTree,
        Dead

    }

    public enum gameTabs
    {
        Home,
        Tree,
        Shop,
        Settings
    }
}
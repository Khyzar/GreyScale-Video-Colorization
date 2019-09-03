using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Microsoft.DirectX.AudioVideoPlayback;

//using System.Runtime.Serialization.Formatters.Binary;
//using System.Runtime.Serialization;
//using System.IO;

namespace GuiForMatlab
{
    public partial class Form2 : MetroFramework.Forms.MetroForm
    {
        bool test = false;
        int counter = 0;
        int num = 0;
        Video video;
        int coun = 0;
        public Form2()
        {
            InitializeComponent();
           // this.BackgroundImage = System.Drawing.Image.FromFile("C:\\Users\\khyzar\\Desktop\\gg.jpg");
            //this.StyleManager = metroStyleManager1;
          //  ControlPaint.DrawBorder(e.this.ClientRectangle, Color.Red, ButtonBorderStyle.Solid);
           // PaintEventArgs e;
           
            pictureNext.Hide();
            picturePrev.Hide();
            picturePlay.Hide();
            picturePause.Hide();
            pictureStop.Hide();
            metroApply.Hide();
            radioButtonMerge.Hide();
            radioButtonSimple.Hide();
            //VideoLabel.Hide();
            //metroProgressSpinner1.Hide();
            
            // Create the ToolTip and associate with the Form container.
            ToolTip toolTip1 = new ToolTip();

            // Set up the delays for the ToolTip.
            toolTip1.AutoPopDelay = 5000;
            toolTip1.InitialDelay = 1000;
            toolTip1.ReshowDelay = 500;
            // Force the ToolTip text to be displayed whether or not the form is active.
            toolTip1.ShowAlways = true;

            // Set up the ToolTip text for the Button and Checkbox.
            //toolTip1.SetToolTip(this.UploadImage, "Click to Upload grayscale image");
            metroToolTip1.SetToolTip(this.metroApply, "Click to Apply Color Transformation");
           // metroToolTip1.SetToolTip(this.metroButton1, "Click to Apply Style");
            metroToolTip1.SetToolTip(this.pictureNext,"Click to select next image");
            //toolTip1.SetToolTip(this.UploadVideo, "Click to Upload Video");
            metroToolTip1.SetToolTip(this.VideoUpload, "click to upload video");
            metroToolTip1.SetToolTip(this.pictureUpload, "click to upload Image");
            metroToolTip1.SetToolTip(this.picturePlay, "click to Play Video");
            metroToolTip1.SetToolTip(this.picturePause, "click to Pause Video");
            metroToolTip1.SetToolTip(this.pictureStop, "click to Stop Video");
                



        }
        Form frmHome;
        public Form2(Form callingForm) //requires a calling form to control from this form
        {
            //  Initialize(); //Already here
            frmHome = callingForm as Form;
        }
        private void button1_Click(object sender, EventArgs e)
        {
          
           // frmHome.Show();
            this.Close();

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
            pictureBox1.Image = System.Drawing.Image.FromFile(openFileDialog1.FileName);
            pictureNext.Show();
            picturePrev.Show();
            //UploadImage.Hide();
        }

        private void buttonNext_Click(object sender, EventArgs e)
        {
            pictureBox1.Image = imageList1.Images[counter];
            counter++;
            if (counter == imageList1.Images.Count)
            {
                counter = 0;
            }
        }

        //private void button4_Click(object sender, EventArgs e)
        //{
        //    // Create the MATLAB instance 
        //    MLApp.MLApp matlab = new MLApp.MLApp();

        //    // Change to the directory where the function is located 
        //    matlab.Execute(@"C:\Users\khyzar\Documents\MATLAB\my.m");

        //    // Define the output 
        //    object result = null;

        //    string imagePath = openFileDialog1.FileName.ToString();
        //    // string address=pictureBox1.ImageLocation.ToString();
        //    string img = Path.GetFileName(imagePath);
        //    string imagePath2 = openFileDialog2.FileName.ToString();
        //    // aa=imageList1.Images[counter - 1].Tag.ToString();
        //    // string address=pictureBox1.ImageLocation.ToString();
        //    string video = Path.GetFileName(imagePath2);

        //    //  string name_a = openFileDialog1.FileName.ToString();
        //    if (counter > 0)
        //    {
        //        img = imageList1.Images.Keys[counter - 1].ToString();
        //    }
        //    int num = 0;
        //    if (radioButtonMerge.Checked)
        //    {
        //        num = 1;
        //    }
        //    if (radioButtonSimple.Checked)
        //    {
        //        num = 0;
        //    }
        //    // Call the MATLAB function myfunc
        //    matlab.Feval("my", 1, out result, img,video);

        //    // Display result 
        //    //   byte[] res = result as object[]; 
        //  //  byte[] res = ObjectToByteArray(result);

        //   // pictureBox2.Image = byteArrayToImage(res);
        //    //Console.WriteLine(res[0]);
        //    //Console.WriteLine(res[1]);
        //    //Console.ReadLine();
        //}

        private void button3_Click(object sender, EventArgs e)
        {
            //openFileDialog2.ShowDialog();
            //folderBrowserDialog1.ShowDialog();
            //int a = 0;
            //if (radioButtonMerge.Checked)
            //{
            //    a = 1;
            //}
            //if (radioButtonSimple.Checked)
            //{
            //    a = 0;
            //}

            if (openFileDialog2.ShowDialog() == DialogResult.OK)
            {
                // store the original size of the panel
                int width = VideoPanel.Width;
                int height = VideoPanel.Height;
                // load the selected video file
                video = new Video(openFileDialog2.FileName);
                // set the panel as the video object’s owner

                video.Owner = VideoPanel;
                // stop the video
                video.Stop();
                // resize the video to the size original size of the panel
                VideoPanel.Size = new Size(width, height);
            }
            picturePlay.Show();
            picturePause.Show();
            pictureStop.Show();
            // openFileDialog2.ShowDialog();
           // pictureBox2.Image = System.Drawing.Image.FromFile(openFileDialog2.FileName);
        }

        private void folderBrowserDialog1_HelpRequest(object sender, EventArgs e)
        {

        }

        private void buttonPlay_Click(object sender, EventArgs e)
        {
            if (video.State != StateFlags.Running)
            {
                video.Play();
            }

        }

        private void buttonPause_Click(object sender, EventArgs e)
        {
            if (video.State == StateFlags.Running)
            {
                video.Pause();
            }

        }

        private void buttonStop_Click(object sender, EventArgs e)
        {
            if (video.State != StateFlags.Stopped)
            {
                video.Stop();
            }

        }

        private void pictureUpload_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
            pictureBox1.Image = System.Drawing.Image.FromFile(openFileDialog1.FileName);
            string img = pictureBox1.ImageLocation;
            test = true;
            pictureNext.Show();
            picturePrev.Show();
            //pictureUpload.Hide();         
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            test = false;
            pictureBox1.Image = imageList1.Images[counter];
            counter++;
            if (counter == imageList1.Images.Count)
            {
                counter = 0;
            }
        }

        private void VideoUpload_Click(object sender, EventArgs e)
        {
            if (openFileDialog2.ShowDialog() == DialogResult.OK)
            {
                // store the original size of the panel
                int width = VideoPanel.Width;
                int height = VideoPanel.Height;
                // load the selected video file
                video = new Video(openFileDialog2.FileName);
                // set the panel as the video object’s owner

                video.Owner = VideoPanel;
                // stop the video
                video.Stop();
                // resize the video to the size original size of the panel
                VideoPanel.Size = new Size(width, height);
            }
            pictureBox2.Hide();
            picturePlay.Show();
            picturePause.Show();
            pictureStop.Show();
            metroApply.Show();
            radioButtonMerge.Show();
            radioButtonSimple.Show();
            VideoLabel.Show();
        }

        private void picturePlay_Click(object sender, EventArgs e)
        {
            if (video.State != StateFlags.Running)
            {
                video.Play();
            }

        }

        private void picturePause_Click(object sender, EventArgs e)
        {
            if (video.State == StateFlags.Running)
            {
                video.Pause();
            }
        }

        private void pictureStop_Click(object sender, EventArgs e)
        {
            if (video.State != StateFlags.Stopped)
            {
                video.Stop();
            }
        }

        private void metroApply_Click(object sender, EventArgs e)
        {
            int index = metroComboBox1.SelectedIndex;
            //if(index==9)
            float plus;
            float resize;
            // Create the MATLAB instance 
            MLApp.MLApp matlab = new MLApp.MLApp();
            int sharp = 0;
            // Change to the directory where the function is located
            if (index == 9 || index == -1)
            {
                matlab.Execute(@"C:\Users\khyzar\Documents\MATLAB\Main.m");
            }
            else
            {
                matlab.Execute(@"C:\Users\khyzar\Documents\MATLAB\Resize.m");
            }
            // Define the output 
            object result = null;

            string imagePath = openFileDialog1.FileName.ToString();
            // string address=pictureBox1.ImageLocation.ToString();
            string img = Path.GetFileName(imagePath);
            string imagePath2 = openFileDialog2.FileName.ToString();
            // aa=imageList1.Images[counter - 1].Tag.ToString();
            // string address=pictureBox1.ImageLocation.ToString();
            string video = Path.GetFileName(imagePath2);
           // imagePath = pictureBox1.ImageLocation;
            //img = Path.GetFileName(imagePath);
            string name_a = openFileDialog1.FileName.ToString();
            if (counter > 0 && test==false)
            {
                img = imageList1.Images.Keys[counter - 1].ToString();
            }
           
            if (radioButtonMerge.Checked)
            {
                num = 1;
            }
            if (radioButtonSimple.Checked)
            {
                num = 0;
            }
            if (SharpBox1.Checked)
            {
                sharp = 1;
            }
            
            //if(metroComboBox1.SelectedItem)
            // Call the MATLAB function myfunc
            //metroProgressSpinner1.Show();
            string tttt = coun.ToString();

            if (index == 9 || index == -1)
            {
                matlab.Feval("Main", 1, out result, video, img, num, sharp, tttt);
            }
            else
            {
                plus = index + 1;
                resize = plus / 10;
                matlab.Feval("Resize", 1, out result, video, img, num, sharp, tttt,resize);
            }
            // Display result 
            //   byte[] res = result as object[]; 
            //  byte[] res = ObjectToByteArray(result);

            // pictureBox2.Image = byteArrayToImage(res);
            //Console.WriteLine(res[0]);
            //Console.WriteLine(res[1]);
            //Console.ReadLine();
           // metroProgressSpinner1.Hide();
            Form3 nn = new Form3(num,coun);
            //nn.StyleManager = this.StyleManager;
            //nn.TopMost = true;
            nn.Show();
            coun++;
        }

        private void metroButton1_Click(object sender, EventArgs e)
        {
            //int a=metroComboBox1.SelectedIndex;
            //metroStyleManager1.Style = (MetroFramework.MetroColorStyle)a;
            ////metroStyleManager1.Theme = MetroFramework.MetroThemeStyle.Light;
            //this.Theme = MetroFramework.MetroThemeStyle.Dark;
            //metroApply.Style = this.Style;
        }

        private void VideoPanel_Paint(object sender, PaintEventArgs e)
        {

        }

        private void picturePrev_Click(object sender, EventArgs e)
        {
            test = false;
            pictureBox1.Image = imageList1.Images[counter];
            counter--;
            if (counter < 0)
            {
                counter = imageList1.Images.Count-1;
            }
        }

        private void metroComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}

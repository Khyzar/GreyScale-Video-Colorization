using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.DirectX.AudioVideoPlayback;

namespace GuiForMatlab
{
    public partial class Form3 : MetroFramework.Forms.MetroForm
    {
        Video video;
        private int num;
        private int ccc;
        int check = 0;
        int counter = 0;
        public Form3()
        {
            InitializeComponent();
            load_video();
        }

        public Form3(int num,int cc)
        {
            // TODO: Complete member initialization
            InitializeComponent();
            this.num = num;
            check = this.num;
            this.ccc=cc;
            counter = this.ccc;
            load_video();
            
        }

        private void Form3_Load(object sender, EventArgs e)
        {

        }
        public void load_video()
        {


           
            //OpenFileDialog t=new OpenFileDialog();
              // t.FileName ="C:\Program Files\MATLAB\R2014a\newvideo.avi";
            if (check == 1)
            {
                openFileDialog1.FileName = "E:\\New folder (4)\\newvideo"+counter+".avi";
            }
            else
                openFileDialog1.FileName = "E:\\New folder (4)\\out"+counter+".avi";
            int width = metroPanelVideo.Width;
            int height = metroPanelVideo.Height;
            // load the selected video file
            video = new Video(openFileDialog1.FileName);
            // set the panel as the video object’s owner

            video.Owner = metroPanelVideo;
            // stop the video
            video.Stop();
            // resize the video to the size original size of the panel
            metroPanelVideo.Size = new Size(width, height);
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
    }
}

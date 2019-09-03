using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;
//using System.Runtime.Serialization.Formatters.Binary;
//using System.Runtime.Serialization;

namespace GuiForMatlab
{
    public partial class Form1 : MetroFramework.Forms.MetroForm
    {
        public Form1()
        {
            InitializeComponent();
          //  ProceedToNextPage();
            metroToolTip1.SetToolTip(this.metroTile1, "click to Proceed");
            this.StyleManager = msnMain;
            msnMain.Theme = MetroFramework.MetroThemeStyle.Dark;
            timer1.Enabled = true;
            timer1.Start();
            timer1.Interval = 1000;
            metroProgressBar1.Maximum = 10;
            timer1.Tick += new EventHandler(timer1_Tick);

           
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
            timer1.Enabled = true;
            timer1.Start();
            timer1.Interval = 1000;
            metroProgressBar1.Maximum = 10;
            timer1.Tick += new EventHandler(timer1_Tick);
        }

        void timer1_Tick(object sender, EventArgs e)
        {
            if (metroProgressBar1.Value != 10)
            {
                metroProgressBar1.Value++;
            }
            else
            {
                timer1.Stop();
            }
        }

       

       

        //public  byte[] ObjectToByteArray(Object obj)
        //{
        //    BinaryFormatter bf = new BinaryFormatter();
        //    using (var ms = new MemoryStream())
        //    {
        //        bf.Serialize(ms, obj);
        //        return ms.ToArray();
        //    }
        //}

        //public Image byteArrayToImage(byte[] byteArrayIn)
        //{
        //    using (MemoryStream mStream = new MemoryStream(byteArrayIn))
        //    {
        //        return Image.FromStream(mStream);
        //    }
        //}
      
     

        private void button1_Click(object sender, EventArgs e)
        {
            Form2 nn = new Form2();
            nn.Show();
        }


        //public void ProceedToNextPage()
        //{
        //    progressBar1.Minimum = 0;
        //    progressBar1.Maximum = 200;
        //    for (int i = 0; i <= 200; i++)
        //    {
        //        progressBar1.Value = i;
        //        //i = i/2 ;
        //    }
            
        //    //this.Hide();
        //  //  Form1 na = new Form1();
        //    //na.Hide();


        //}



        private void progressBar1_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
           
        }

        private void ProceedButton_Click(object sender, EventArgs e)
        {
            Form2 nn = new Form2();
            nn.StyleManager = this.StyleManager;
            //nn.TopMost = true;
            nn.Show();
        }

        private void metroButton1_Click(object sender, EventArgs e)
        {
           // msnMain.Style = (MetroFramework.MetroColorStyle)Convert.ToInt32(metroComboBox1.Text);
        }

        private void metroTile1_Click(object sender, EventArgs e)
        {
            Form2 nn = new Form2();
           // nn.StyleManager = this.StyleManager;
            //nn.TopMost = true;
            nn.Show();
        }
    }
}

namespace GuiForMatlab
{
    partial class Form3
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form3));
            this.metroPanelVideo = new MetroFramework.Controls.MetroPanel();
            this.picturePlay = new System.Windows.Forms.PictureBox();
            this.picturePause = new System.Windows.Forms.PictureBox();
            this.pictureStop = new System.Windows.Forms.PictureBox();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            ((System.ComponentModel.ISupportInitialize)(this.picturePlay)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.picturePause)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureStop)).BeginInit();
            this.SuspendLayout();
            // 
            // metroPanelVideo
            // 
            this.metroPanelVideo.BackColor = System.Drawing.Color.Transparent;
            this.metroPanelVideo.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.metroPanelVideo.HorizontalScrollbarBarColor = true;
            this.metroPanelVideo.HorizontalScrollbarHighlightOnWheel = false;
            this.metroPanelVideo.HorizontalScrollbarSize = 10;
            this.metroPanelVideo.Location = new System.Drawing.Point(88, 76);
            this.metroPanelVideo.Name = "metroPanelVideo";
            this.metroPanelVideo.Size = new System.Drawing.Size(893, 235);
            this.metroPanelVideo.TabIndex = 0;
            this.metroPanelVideo.UseCustomBackColor = true;
            this.metroPanelVideo.UseCustomForeColor = true;
            this.metroPanelVideo.UseStyleColors = true;
            this.metroPanelVideo.VerticalScrollbarBarColor = true;
            this.metroPanelVideo.VerticalScrollbarHighlightOnWheel = false;
            this.metroPanelVideo.VerticalScrollbarSize = 10;
            // 
            // picturePlay
            // 
            this.picturePlay.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.picturePlay.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.picturePlay.Image = ((System.Drawing.Image)(resources.GetObject("picturePlay.Image")));
            this.picturePlay.Location = new System.Drawing.Point(88, 317);
            this.picturePlay.Name = "picturePlay";
            this.picturePlay.Size = new System.Drawing.Size(55, 50);
            this.picturePlay.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picturePlay.TabIndex = 1;
            this.picturePlay.TabStop = false;
            this.picturePlay.Click += new System.EventHandler(this.picturePlay_Click);
            // 
            // picturePause
            // 
            this.picturePause.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.picturePause.Image = ((System.Drawing.Image)(resources.GetObject("picturePause.Image")));
            this.picturePause.Location = new System.Drawing.Point(161, 317);
            this.picturePause.Name = "picturePause";
            this.picturePause.Size = new System.Drawing.Size(55, 50);
            this.picturePause.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picturePause.TabIndex = 2;
            this.picturePause.TabStop = false;
            this.picturePause.Click += new System.EventHandler(this.picturePause_Click);
            // 
            // pictureStop
            // 
            this.pictureStop.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pictureStop.Image = ((System.Drawing.Image)(resources.GetObject("pictureStop.Image")));
            this.pictureStop.Location = new System.Drawing.Point(234, 317);
            this.pictureStop.Name = "pictureStop";
            this.pictureStop.Size = new System.Drawing.Size(55, 50);
            this.pictureStop.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureStop.TabIndex = 3;
            this.pictureStop.TabStop = false;
            this.pictureStop.Click += new System.EventHandler(this.pictureStop_Click);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // Form3
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1054, 415);
            this.Controls.Add(this.pictureStop);
            this.Controls.Add(this.picturePause);
            this.Controls.Add(this.picturePlay);
            this.Controls.Add(this.metroPanelVideo);
            this.Name = "Form3";
            this.Style = MetroFramework.MetroColorStyle.Orange;
            this.Text = "Coloured Video";
            this.TextAlign = MetroFramework.Forms.MetroFormTextAlign.Center;
            this.Theme = MetroFramework.MetroThemeStyle.Dark;
            this.Load += new System.EventHandler(this.Form3_Load);
            ((System.ComponentModel.ISupportInitialize)(this.picturePlay)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.picturePause)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureStop)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private MetroFramework.Controls.MetroPanel metroPanelVideo;
        private System.Windows.Forms.PictureBox picturePlay;
        private System.Windows.Forms.PictureBox picturePause;
        private System.Windows.Forms.PictureBox pictureStop;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
    }
}
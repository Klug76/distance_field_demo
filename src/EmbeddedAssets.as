package
{

	public class EmbeddedAssets
	{
		// Bitmap Fonts

		[Embed(source = "../embed/Ubuntu-R.fnt", mimeType = "application/octet-stream")]
		public static const ubuntu_r_fnt: Class;

		[Embed(source = "../embed/Ubuntu-R.png")]
		public static const ubuntu_r: Class;
	}

}
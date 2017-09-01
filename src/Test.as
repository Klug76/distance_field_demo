package
{
	import feathers.controls.LayoutGroup;
	import feathers.controls.text.BitmapFontTextRenderer;
	import feathers.text.BitmapFontTextFormat;
	import starling.animation.IAnimatable;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.styles.DistanceFieldStyle;
	import starling.text.TextField;
	import starling.text.TextFormat;
	import starling.utils.AssetManager;

	public class Test extends LayoutGroup
	{

		public function Test()
		{
			load_Assets();
		}

		private function load_Assets(): void
		{
			var assets: AssetManager = new AssetManager();
			assets.verbose = CONFIG::debug;
			assets.enqueue(EmbeddedAssets);


			assets.loadQueue(function(ratio: Number): void
			{
				if (1 == ratio)
					on_Load_Complete2();
			});

		}

		private function on_Load_Complete(): void
		{
			var df: DistanceFieldStyle;

			df = new DistanceFieldStyle();
			df.multiChannel = true;
			df.setupOutline(0.5, 0x115588);

			var text1: TextField = new TextField(300, 100, "Hello,", new TextFormat("ubuntu_r", 64, 0xeeee00));
			text1.x = 200;
			text1.y = 100;
			text1.style = df;
			addChild(text1);

			df = new DistanceFieldStyle();
			df.multiChannel = true;
			//df.setupOutline(0.5, 0x115588);
			df.setupDropShadow(0.5, 2, 2, 0xff0000);

			var text2: TextField = new TextField(300, 100, "World!", new TextFormat("ubuntu_r", 96, 0xeeee00));
			text2.x = 200;
			text2.y = 300;
			text2.style = df;
			addChild(text2);
		}

		private function on_Load_Complete2(): void
		{
			var df: DistanceFieldStyle;

			df = new DistanceFieldStyle();
			df.multiChannel = true;
			df.setupOutline(0.5, 0x115588);

			var bf: BitmapFontTextFormat;
			bf = new BitmapFontTextFormat("ubuntu_r", 64, 0xeeee00);

			var text1: BitmapFontTextRenderer = new BitmapFontTextRenderer();
			text1.text = "Hello,";
			text1.textFormat = bf;
			text1.x = 200;
			text1.y = 100;
			text1.style = df;
			addChild(text1);

			df = new DistanceFieldStyle();
			df.multiChannel = true;
			//df.setupOutline(0.5, 0x115588);
			df.setupDropShadow(0.5, 2, 2, 0xff0000);

			bf = new BitmapFontTextFormat("ubuntu_r", 96, 0xeeee00);

			var text2: BitmapFontTextRenderer = new BitmapFontTextRenderer();
			text2.text = "World!";
			text2.textFormat = bf;
			text2.x = 200;
			text2.y = 300;
			text2.style = df;
			addChild(text2);
		}

	}
}
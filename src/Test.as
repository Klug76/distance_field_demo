package
{
	import feathers.controls.LayoutGroup;
	import feathers.controls.text.BitmapFontTextRenderer;
	import feathers.text.BitmapFontTextFormat;
	import starling.animation.IAnimatable;
	import starling.core.Starling;
	import starling.events.Event;
	import starling.styles.DistanceFieldStyle;
	import starling.utils.AssetManager;

	public class Test extends LayoutGroup implements IAnimatable
	{
		private var text1_: BitmapFontTextRenderer;

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
                    on_Load_Complete();
            });

		}

		private function on_Load_Complete(): void
		{
			var df: DistanceFieldStyle = new DistanceFieldStyle();
			df.multiChannel = true;
			df.setupOutline(0.5, 0x115588);

			text1_ = new BitmapFontTextRenderer();
			text1_.textFormat = new BitmapFontTextFormat("ubuntu_r", 96, 0xeeee00);
			text1_.text = "Hello, World!";
			text1_.move(400, 300);
			text1_.style = df;
			addChild(text1_);
			text1_.visible = false;

			Starling.juggler.add(this);
			addEventListener(Event.RESIZE, on_Resize);
		}

		private function on_Resize(e: Event): void
		{
			trace("size: ", width, height);
			trace("stage.size: ", stage.stageWidth, stage.stageHeight);
			//text1_.move(width * 0.5, height * 0.5);
			text1_.move(stage.stageWidth * 0.5, stage.stageHeight * 0.5);
		}

		private const delta: Number = 0.1;

		private var msx: Number = 0;
		private var msy: Number = 0;
		private var msdx: Number = 0;
		private var msdy: Number = 1;

		public function advanceTime(time: Number): void
		{
			if (!text1_.visible)
			{
				if (text1_.width < 1)
					return;
				text1_.alignPivot();
				text1_.visible = true;
			}
			msdx += msdy * 2;
			if (msdx > 4)
			{
				msdy = -delta;
				msdx = 4;
			}
			else if (msdx < -4)
			{
				msdy = delta;
				msdx = -4;
			}
			msx += msdx;
			text1_.rotation = msx / 360;
		}
	}
}
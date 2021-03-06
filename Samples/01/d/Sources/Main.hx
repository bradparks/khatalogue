class Main {
	static var random = new kha.math.Random(0);

	static var amplitude : Int = 100;
	static var period : Int = 100;

	static var color : kha.Color = kha.Color.White;

	static function main() {
		kha.System.init(
			{title: "Khatalogue - 01d", width: 640, height: 240},
			init
		);
	}

	static function init() : Void {
		kha.System.notifyOnRender(render);
		kha.Scheduler.addTimeTask(update, 0, 1 / 60);
	}

	static function update() : Void {}

	static function render(framebuffer : kha.Framebuffer) : Void {
		var g1 = framebuffer.g1;
		g1.begin();
		for (i in 0...framebuffer.width) {
			var dy = Math.sin(kha.Scheduler.time() + i / period);
			color.A = Math.abs(dy);
			g1.setPixel(
				i,
				120 + Std.int(amplitude * dy),
				color
			);
		}
		g1.end();
	}
}

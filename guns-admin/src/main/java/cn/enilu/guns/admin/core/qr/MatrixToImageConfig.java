/*
 * Copyright 2012 ZXing authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package cn.enilu.guns.admin.core.qr;

import java.awt.image.BufferedImage;

/**
 * Encapsulates custom configuration used in methods of
 * {@link MatrixToImageWriter}.
 */
public final class MatrixToImageConfig {

	public static final int BLACK = 0xFF000000;
	public static final int WHITE = 0xFFFFFFFF;

	private final int onColor;
	private final int offColor;

	/**
	 * Creates a default config with on color {@link #BLACK} and off color
	 * {@link #WHITE}, generating normal black-on-white barcodes.
	 */
	public MatrixToImageConfig() {
		this(BLACK, WHITE);
	}

	/**
	 * @param onColor  pixel on color, specified as an ARGB value as an int
	 * @param offColor pixel off color, specified as an ARGB value as an int
	 */
	public MatrixToImageConfig(int onColor, int offColor) {
		this.onColor = onColor;
		this.offColor = offColor;
	}

	public int getPixelOnColor() {
		return onColor;
	}

	public int getPixelOffColor() {
		return offColor;
	}

	int getBufferedImageColorModel() {
		// Use faster BINARY if colors match default
		return onColor == BLACK && offColor == WHITE ? BufferedImage.TYPE_BYTE_BINARY : BufferedImage.TYPE_INT_RGB;
	}

}
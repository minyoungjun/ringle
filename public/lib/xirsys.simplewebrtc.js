'use strict';

/*********************************************************************************
	The MIT License (MIT) 

	Copyright (c) 2014 XirSys

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.

*********************************************************************************/

(function () {

	$xirsys.class.create({
		namespace : 'simplewebrtc',
		constructor : function ($url) {
			if (!!$url) {
				$xirsys.signal.tokenUrl = $url + "signal/token";
			}
		},
		fields : {
			connectionTypes: {
				default: 'default',
				direct: 'direct',
				server: 'server'
			},
			token : "",
			xirsys_opts : null
		},
		methods : {
			connect : function ($opts, $rtcOpts) {
				this.xirsys_opts = $opts;
				$rtcOpts = $rtcOpts || {};
				$rtcOpts.url = "http://endpoint02.uswest.xirsys.com:8080";
				this.ref = new SimpleWebRTC($rtcOpts);
			},
			on : function ($ev, $fun) {
				this.ref.on($ev, $fun);
			},
			getDomId : function ($peer) {
				return this.ref.getDomId($peer);
			},
			capabilities : function () {
				return this.ref.capabilities;
			},
			createRoom : function ($room, $fun) {
				var self = this;
				if (!!$room) {
					this.xirsys_opts.room = $room;
				}
				this.getToken(null, null, function ($data) {
					self.token = $data.d.token;
					self.ref.createRoom(self.token, $fun);
				});
			},
			joinRoom : function ($room) {
				var self = this;
				if (!!$room) {
					this.xirsys_opts.room = $room;
				}
				this.getToken(null, null, function ($data) {
					self.token = $data.d.token;
					self.ref.joinRoom(self.token);
				});
			},
			getToken : function ($url, $data, $cb) {
				var self = this;
				$xirsys.ajax.do({
					url: $url || $xirsys.simplewebrtc.tokenUrl,
					method: 'GET',
					data: $data || self.xirsys_opts
				}) 
				.done($cb);
			},
			getLocalScreen : function () {
				return this.ref.getLocalScreen();
			},
			stopScreenShare : function () {
				this.ref.stopScreenShare();
			},
			shareScreen : function ($handle) {
				this.ref.shareScreen($handle);
			}
		},
		statics : {
			tokenUrl : $xirsys.baseUrl + "signal/token"
		}
	});

})();

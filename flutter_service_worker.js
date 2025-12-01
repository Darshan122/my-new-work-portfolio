'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"loader.css": "3ed0540af717cd56f01a37a08f714759",
"manifest.json": "76858bfccb016815b5d8257df072ea5f",
"index.html": "6fcdf36a5e7e4341d8c0626ec31dcfb4",
"/": "6fcdf36a5e7e4341d8c0626ec31dcfb4",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "fd1f22c9244d5f5a6424e94917879723",
"assets/assets/person_small.png": "6f780d058150543096d7bd3060db4ac4",
"assets/assets/phone.png": "45903a1ffa9ede882171aca9f71c4c29",
"assets/assets/person.png": "5b6ba176416812aa5448c6704d31caa0",
"assets/assets/brand1.png": "f3a3a0de79048e1f14aac62ec76609b8",
"assets/assets/image_me.png": "5359c8f0017ff5e43ba538df14dc6ab9",
"assets/assets/whatsapp.png": "426617ad28567da23a2346566d84b5a6",
"assets/assets/ic_xcode.png": "53328b9f6ab9fbde14d2c51d8177d135",
"assets/assets/brand4.png": "e9441e9a5d26e508f592aa31b9febff6",
"assets/assets/ic_flutter.png": "d551b82910169ed7ceb2f59edcdcb661",
"assets/assets/ESH_image/img_esh.png": "f817e8d8f196d127c16286d79bde9626",
"assets/assets/ESH_image/esh_screen%25208.png": "3deba43fe5390c5759e826a6c04f88a7",
"assets/assets/ESH_image/esh_screen%25206.png": "b25101a5ab9a291a4a0af33709510eb8",
"assets/assets/ESH_image/esh_screen%25203.png": "2d4abba8201a12a38589cafbbcbbd69e",
"assets/assets/ESH_image/esh_screen%25201.png": "fc309aeb6cafe6a29a6215db35068167",
"assets/assets/ESH_image/esh_screen%25202.png": "9dc57ddc670ac21c5ea7f61f2a17c16d",
"assets/assets/ESH_image/esh_screen%25204.png": "4d46e332616b2dd54db3ba8260b4b05b",
"assets/assets/ESH_image/esh_screen%25205.png": "83e6a8132c40c9d6677313c78c0124f2",
"assets/assets/img_theai.png": "e962b54b8e333208ae258247aef6f8e4",
"assets/assets/ios.png": "49f79e21da11e96b8cf0e3b8bef6616c",
"assets/assets/github_icon.svg": "de1e2412862794fc619d26c46ff7c4ef",
"assets/assets/email.png": "5eb3c4b86aafbee72b8c471b29413a50",
"assets/assets/male.png": "a687ddbf4597360c3b9e293a58b1d829",
"assets/assets/ic_android.png": "27cc4779af8ce170a58d1974a8fa9c39",
"assets/assets/quote.png": "1a0aa9a06293ac5689bc32012e0e13e6",
"assets/assets/write.png": "dc4f0d3df06d5fc9b13b9168b88e2560",
"assets/assets/brand5.png": "fc57e9a9ff95830ea207e2452ffd4bd6",
"assets/assets/female.png": "29c52b49d99a5de88d34ab04aafe3f59",
"assets/assets/UltraRays_Business/Home-left.png": "8fe603752cdc6192e2db000a5e8a3205",
"assets/assets/UltraRays_Business/Notification-portrait.png": "9f41c213fd5dbf3249dd259b2026d063",
"assets/assets/UltraRays_Business/User.-portrait.png": "e213683864d07da6631e9651f64375bc",
"assets/assets/UltraRays_Business/Deliver%2520Stocks-portrait.png": "7e2c61a35402a604cf00a636459b60cb",
"assets/assets/UltraRays_Business/Frame-portrait.png": "2f96ed9ea6e1889bc85c5d50b45518e9",
"assets/assets/UltraRays_Business/Home-portrait.png": "357ba5ef3dcd951108b23643fd53d0dd",
"assets/assets/UltraRays_Business/My%2520Account-portrait.png": "91d6f9fc42e2207a34f53ce5fc4f2397",
"assets/assets/UltraRays_Business/New%2520Stock-portrait.png": "49005ab76a6f9b8b470c4b934d31b23b",
"assets/assets/promote.png": "2bd8adcad79a4ebb80888d1a0583b3c4",
"assets/assets/develop.png": "471c2c94d5d04112086eba9fd78c6809",
"assets/assets/UltraRays_image/Plan%2520Quotation-portrait.png": "80cea0de8a96ee6e2b82445365622540",
"assets/assets/UltraRays_image/Payment1-portrait.png": "5f352dcbe077ff981aa118263d1e1ea1",
"assets/assets/UltraRays_image/Payment-portrait.png": "9768f5d142eb70b7f5f0326e3a1067d6",
"assets/assets/UltraRays_image/Home-portrait.png": "3315865feba8206cb7bcf0d65d646712",
"assets/assets/UltraRays_image/My%2520Account-portrait.png": "8a6bef7a9afc55b18bd75caf768c05d3",
"assets/assets/UltraRays_image/Plan%2520Quotation1-portrait.png": "d9bf22135fcf392a6d12d6a99e14265f",
"assets/assets/UltraRays_image/Select%2520Plan-portrait.png": "f4e52193db4155aaf64b3d99254178ff",
"assets/assets/UltraRays_image/Splash-portrait.png": "8f82434b578b01cfb5dd07e75a89434f",
"assets/assets/img_ultraRays.png": "d1607b25251718744cf2a149586c2ee1",
"assets/assets/brand2.png": "91c6d8820e35e10e39757e0de6ac4345",
"assets/assets/design.png": "6aaec412d8837ac9a83f03f453877606",
"assets/assets/img_entaj.png": "bfdc40a263a7fd3ff7b0e41228bc1db0",
"assets/assets/laptop.png": "fb49e3c0c36437239db5f8c114b03062",
"assets/assets/linkedin_icon.svg": "66fc2ff695910a1e5f00ec33d64dc007",
"assets/assets/img_cineconnection.png": "baa35501d54328eb6fb7097a11745df5",
"assets/assets/mappin.png": "9cc090022ae31337336d2024160714b8",
"assets/assets/img_f.png": "3393b0f5b0b8b73a9e0312c6d850d2a4",
"assets/assets/ic_figma.png": "155e10db35836b17504c171b7278f613",
"assets/assets/brand3.png": "c0915a84744f3481a2105c5aea6727e0",
"assets/assets/cv/Darshan_Zalavadiya_Resume.pdf": "e042026cc8ea789fdbd1baa05ae9e378",
"assets/fonts/MaterialIcons-Regular.otf": "f8226f4000301f984de6a0408d80e63a",
"assets/NOTICES": "6397538a27ed1ba5f3b3ba02789dc8a4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Solid-900.otf": "5b8d20acec3e57711717f61417c1be44",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Brands-Regular-400.otf": "1fcba7a59e49001aa1b4409a25d425b0",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Regular-400.otf": "b2703f18eee8303425a5342dba6958db",
"assets/FontManifest.json": "c75f7af11fb9919e042ad2ee704db319",
"assets/AssetManifest.bin": "f3eed96af5bf19120c8eddda72dd79bb",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter_bootstrap.js": "7de9f1b1061f584e3cd1ea86de99278c",
"version.json": "bd341ba74d38c530da636604a427deda",
"main.dart.js": "41b699c61586b2c8ff3719e7ab00a9b5"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

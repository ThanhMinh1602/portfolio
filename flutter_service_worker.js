'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "047d194d745fad9574f8f5cc591fee94",
"version.json": "93f79c4845bca743997d155b19290ff9",
"index.html": "a4eb38d61144c2ea4a801c2e4d71b1c0",
"/": "a4eb38d61144c2ea4a801c2e4d71b1c0",
"main.dart.js": "88b025c768988215cb0dd4fc7103b448",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "12d7bdd74e7cfccdfc48b67029244e78",
".git/ORIG_HEAD": "8d4303cf8b5f8429f31c52236296775f",
".git/config": "f467ef92507f432a117417a06a2c00ca",
".git/objects/0d/c7e141e56d6dddcdebef5061be6865cf0eeb78": "0116da80ce97958875bcaf3bb8e237a9",
".git/objects/0c/169b84ce8a2d7f20b8d70733a9782c1728e1b7": "fe2b7c9c745252568ec9c81ecbe19567",
".git/objects/3e/1c56ceabff3c52745316da3ff5b13a0676412b": "72905261cf77908e388bd8be2ad6da2f",
".git/objects/3e/d0ddd7136a48520910e7e4bf665362facd60d4": "c8322669a78b5f07c75b1decdc05718d",
".git/objects/57/7946daf6467a3f0a883583abfb8f1e57c86b54": "846aff8094feabe0db132052fd10f62a",
".git/objects/57/ad3807061efcd5d14730477e148dc575c44b8f": "0814af8c4d35f0ce01ae6d488997fbcd",
".git/objects/03/2fe904174b32b7135766696dd37e9a95c1b4fd": "80ba3eb567ab1b2327a13096a62dd17e",
".git/objects/9b/db1b168c3b587e72899504333f58a1b14cabbd": "bd0ce277bb6e58566059dceceb9cead2",
".git/objects/04/b72142fa9889b3fb88681f14f66100085cfde0": "575a18fde546f0036f0629161dd5c2a5",
".git/objects/6a/cf0e48bd9d1bca6330fbbe0127cf68e2dc013c": "3aaf003e7272aae7382246441889e708",
".git/objects/35/96d08a5b8c249a9ff1eb36682aee2a23e61bac": "e931dda039902c600d4ba7d954ff090f",
".git/objects/35/a4df52608ac242cc40882acd6d9d22032b0577": "8affc5e52eff588358b63f2a3d11b837",
".git/objects/69/e1d63738b88500227114fd674f79234c818b97": "2af55598140529349ac1235db52cab5e",
".git/objects/60/ddaa81c03e297061c9c76f2b3126cff4dba9ac": "208c370b710994ec844a74c68ddfa028",
".git/objects/5f/bf1f5ee49ba64ffa8e24e19c0231e22add1631": "f19d414bb2afb15ab9eb762fd11311d6",
".git/objects/b2/92898c60ba7ef9ba4cc23af277eca2f7de7cfb": "8c2dd63d3453f6a052855589adac7dd9",
".git/objects/d9/3952e90f26e65356f31c60fc394efb26313167": "1401847c6f090e48e83740a00be1c303",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/d7/7a4e0b1ebc12f39424492c459d7eb522707c7d": "a2d22e60993ff859d4d633b9ce1cb769",
".git/objects/da/54a6125b68688d615970b3320cb97f49d2ece2": "8d669dc4a3b2cbca6f1844c3ec1bd2d9",
".git/objects/a5/de584f4d25ef8aace1c5a0c190c3b31639895b": "9fbbb0db1824af504c56e5d959e1cdff",
".git/objects/bd/6be43d015a2a8a92db341ee519feb383a20cb4": "0df4c80430aff6e9b0cdd970bc215545",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/e2/3e1e99f9bbcdd9c75e3d9f99eab64232cd0e71": "e4bb3be0610f2e1708bf0fb7f5d47dec",
".git/objects/f3/709a83aedf1f03d6e04459831b12355a9b9ef1": "538d2edfa707ca92ed0b867d6c3903d1",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/c0/a9fb99725a727d130db39e5ca271f049160dcb": "e2a520555f314ca39fc90d7fd9dab492",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/e3/bcf68a88b9f8f3b72d5b881e90e7c192ff568f": "127f8c9616ae603c3936f1e9d66366ee",
".git/objects/ed/4aba6275e918112c16adb4b43f0a182abedb73": "66eb3bda089c8bee9ef04ed9d5d54d97",
".git/objects/29/c896aa7e4eb846c5ea88851b1774e72f4355fb": "cf64e621ddb2a28f42bf06cc243e4b45",
".git/objects/89/1ba160bf08a234667ad2c5c15c758d6d89688f": "ffd060ea13bb264623394f5b1f7ae6fe",
".git/objects/74/53566aeeefc39b59fd03da090c4e52e8531098": "a5f46ab9c03886653b2d109567fd367f",
".git/objects/28/b29d877519bf378bfa772db30dd75309ad5fd6": "1bcfdef353d9bde709e831b01ce204c3",
".git/objects/28/c8a120f3090fe7f5b91b12ab6bf36d87ec9f81": "fc0f6cc0516cfea4e0f19437159f0b72",
".git/objects/7b/25372dad86d13a864e575040cf298633c82ad4": "e4cb3cbc42d840a41cedf74a92ee4664",
".git/objects/8a/51a9b155d31c44b148d7e287fc2872e0cafd42": "9f785032380d7569e69b3d17172f64e8",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/44/64a4d83907c87f4d10f00d5a05b0b0b825ef14": "da9bacc64222525bd27e5a2833b2787b",
".git/objects/88/44b47b96f8b731dd3890ffef0874a9a9436d8e": "09576e864587938c8a62e4ba69cd38f0",
".git/objects/88/918ed87e10b86db1cfcc203763c8b25191c664": "5f8e65848e7866b451bc0181ac944321",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/88/820adfd9c5d7f55a482d4d60f3fd80079d4b53": "13711a4fd8b4fdf61fd7686795af897f",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/5d/77178be0736e9c1aa09e6a2961d89fa53c132f": "8df1706c2997d122019a3595fd66f6b8",
".git/objects/91/4f456216e81647ed3f43eea029be0e5473d412": "18313293f89959b93440c411d5b11dc0",
".git/objects/91/4a40ccb508c126fa995820d01ea15c69bb95f7": "8963a99a625c47f6cd41ba314ebd2488",
".git/objects/5e/db2ee53d2f68359a2e7514bebe5af7de08d228": "584e39f4ed6be00285cc51b3b369a4e2",
".git/objects/99/58c1eef109bac254965540f76f417e94999df7": "f7c302d06b3f9f3b1c219541f0f0d8a2",
".git/objects/99/1a8da94385d634b6c088f628242e12eb2f99c0": "2422c8bae52de37e7ecb348811c4c1c6",
".git/objects/90/0158d1f49a943f740051100bb217b2a3de0ab2": "2c994111c3dd7d797a2c409063699552",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/a0/865bb9744d0cdf4fe056ea0a4364faeb2f5ac2": "be034b559182a851e84a275700f27acb",
".git/objects/dd/d6f34cc6d8eee4f9337ad5df3848d148e7054e": "b7b201742da30894b683756533d0c713",
".git/objects/dc/f83695f71da8c6278eb914cdd42692c427924e": "9ca7f32e12839dea4610032ada023058",
".git/objects/a9/a0928538694ab5d39c0e61468466da4f2667a7": "a01f38a14384c18940deb9b57e654a26",
".git/objects/aa/e0a5338abe5f7e8000318b6e47af7611fab9e2": "8a1e30a492908dc4cdf8c90730bd8c95",
".git/objects/aa/b4821d31d04be0be619a654a3070b31d1601ca": "fcf0714c0e380ca86cd960584b5f7b99",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/a8/8c9340e408fca6e68e2d6cd8363dccc2bd8642": "11e9d76ebfeb0c92c8dff256819c0796",
".git/objects/b0/ef0b88d4e0da906a86f8871e4318e85108bc3b": "82c4bb7ace8a75c20711d40c67cb7ac2",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ef/b875788e4094f6091d9caa43e35c77640aaf21": "27e32738aea45acd66b98d36fc9fc9e0",
".git/objects/f0/3210ba6e123c505beab4fde76e438b12ab0408": "d07f123d2e28244bd5cd521d5f3ae317",
".git/objects/fa/11aa3dd894eb24d2bcabf0ba95d8774cc21dde": "33e479a773ec95f79a0ac1a755a4026d",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/f1/c7dce5d7be578b5859d27aed8c4fdf87bc8065": "d4912c02f71c909896b728200115f718",
".git/objects/cb/6b7a6137f8e01d986294349a6bc2fadc6d1849": "9df7d09456db8013ef6b3c4b23309f7a",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/2c/b46591622b69e98f5677058e1fec373f74041a": "e85b2de3612bf0d4cfc3314398ece48f",
".git/objects/79/c113f9b50178eefaedb999950fa206eaf6d645": "0a062ce1fa85a99ed952de77de2c04ee",
".git/objects/84/815415f1a2c4852716f8f5a55bbffd2834a6b1": "4f83b8066a465fda1b51e2bbd5e8ce93",
".git/objects/23/2ded2627097d736fb6271b64a0f81acb291b8a": "c7ade85b66ca1f9eb44924164ce621bd",
".git/objects/23/6d324e2c6a4e7f9a0d31fbb30ab29364168c25": "1814922bb849a9b443736ac92c629fa6",
".git/objects/4f/02e9875cb698379e68a23ba5d25625e0e2e4bc": "254bc336602c9480c293f5f1c64bb4c7",
".git/objects/76/08a2e59cfb88547766b1a40ccef2d7d06bfa10": "e0857e5058ed6dc2c19a4ccdc0d4d55b",
".git/objects/1c/3da15ba3980fde77830e2586268d29831c2ae4": "24678c63e6ccb538a73516048ad71d99",
".git/objects/1c/33774c0a07932c39c806bb562a53f7afc3367d": "0381e778ba677699e1a1c7298fafa62a",
".git/objects/49/d9061b033ea6aa396946a8c2768212dcbea97d": "7a4e3b66f24aea86b1f5921bdd2a802b",
".git/objects/40/1184f2840fcfb39ffde5f2f82fe5957c37d6fa": "1ea653b99fd29cd15fcc068857a1dbb2",
".git/objects/8b/7c6562e84274e4338e3f50eaac1c583f5b5261": "5db649168e34dc819a1914d7c7cf6d67",
".git/objects/8e/b090d0c1df9214414847ee6b6b92e2e288185b": "da3466f9e827e57524db332dd52ad195",
".git/objects/8e/c30df964894115f7f3305cf23ec1010d1aa2e7": "72066f73255594aaf7c5e1aa198f9f99",
".git/objects/25/b5c1829bca58c3c81ff1d65f7ac34cc9ce5522": "fca80437310918f511a62dd8899be364",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "a6e3960d89eafe1f7e903619fd9dcbc5",
".git/logs/refs/heads/gh-pages": "71699cc0effb8e38a23c1979fb8a937b",
".git/logs/refs/heads/main": "90625684219027d8ef340b542b0388b1",
".git/logs/refs/remotes/origin/gh-pages": "e3371450ce9427553a1cc271f47e70c4",
".git/logs/refs/remotes/origin/main": "240df00e7baf9a74a8b08cb617af0856",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/gh-pages": "8d4303cf8b5f8429f31c52236296775f",
".git/refs/heads/main": "8d4303cf8b5f8429f31c52236296775f",
".git/refs/remotes/origin/gh-pages": "8d4303cf8b5f8429f31c52236296775f",
".git/refs/remotes/origin/main": "8d4303cf8b5f8429f31c52236296775f",
".git/index": "ba7ace33acaf2e0af3eee28da0f35cd1",
".git/COMMIT_EDITMSG": "33524a2ff624c1cf504a4c61314b2883",
".git/FETCH_HEAD": "d8b609bb02b3a63170954d244688344e",
"assets/AssetManifest.json": "ef6567c23bc29d601cb2d38c4c373f4f",
"assets/NOTICES": "045623ce03b40825ec5b019cb2623b5c",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "bc56027f68ef0fabf98d1d8577f332a7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "e5fc9fd56824ea1087ead11f0e6a5f84",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/assets/images/appicon.png": "8adc0583c3e62f4f140499e33f0efed8",
"assets/assets/icons/star.svg": "07aa01dc4a1c185f0c4d07c626c69b95",
"assets/assets/icons/frame1.svg": "ae37f5436f7d39f3b008879afec2d4e0",
"assets/assets/icons/frame2.svg": "aec67b82adfc4e89c8bdc9c34927e9ab",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
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

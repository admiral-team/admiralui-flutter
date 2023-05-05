'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "ff966ab969ba381b900e61629bfb9789",
"index.html": "d8da388ece2d1d3879356b614d004746",
"/": "d8da388ece2d1d3879356b614d004746",
"main.dart.js": "93ca5213a434595988704531ecda817d",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "0867c3e13649ac4d06fe34b7b3ddce08",
"lib/fonts/AdmiralIcons.ttf": "3b1d0ca9e119b5140ca67cbf7d274c9a",
"assets/AssetManifest.json": "03ff48b8e01ab3745c56a04a2071406a",
"assets/NOTICES": "17cea5ff44a2b50d670a989290ad3b97",
"assets/FontManifest.json": "696c8de939d296df72145d679537203f",
"assets/packages/golden_toolkit/fonts/Roboto-Regular.ttf": "ac3f799d5bbaf5196fab15ab8de8431c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/admiralui_flutter/lib/fonts/SFProText-Medium.ttf": "8b61dea99518b51d5511dc3963a5537c",
"assets/packages/admiralui_flutter/lib/fonts/SFProText-Regular.ttf": "85bd46c1cff02c1d8360cc714b8298fa",
"assets/packages/admiralui_flutter/lib/fonts/SFProDisplay-Medium.ttf": "8296fbc23d1d42f2954c7af6698cf579",
"assets/packages/admiralui_flutter/lib/fonts/SFProDisplay-Regular.ttf": "d704bcd64b0f4fa155e6bd7debacc6c4",
"assets/packages/admiralui_flutter/lib/fonts/AdmiralIcons.ttf": "3b1d0ca9e119b5140ca67cbf7d274c9a",
"assets/packages/admiralui_flutter/lib/fonts/SFProDisplay-Bold.ttf": "4e99e4e132b0bd1ccd4e27596b15df8f",
"assets/packages/admiralui_flutter/lib/fonts/SFProText-Bold.ttf": "23ae29cff15becd829501874372fa850",
"assets/packages/admiralui_flutter/lib/fonts/SFProDisplay-Semibold.ttf": "962956e157e4687b7c79d1dafb2b9fb0",
"assets/shaders/ink_sparkle.frag": "0ff5c2d72578756a2d288596d5a621dc",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/Russia.png": "8b739dc55f085163986ced43d2373182",
"assets/assets/Card.png": "39614c0d7ad46da0801c2ecc99c98be3",
"assets/assets/CheckSolid.png": "b28c92dca704e8dc872b7e63375310e0",
"assets/assets/Illustration.png": "87e8c0a6ee3b353368c635570d08edb1",
"assets/assets/applePay.png": "a2f255ad7b1874cd9b5fcc27c9a09e19",
"assets/assets/LogoVisa.jpg": "8cc9bc62def1746a7a3c9ae44b504392",
"assets/assets/Logo.png": "63c475fb7b5552a038cba105a8fdc7cb",
"assets/assets/logoMir.png": "bc198cdde83994982fcdb12e0d8af597",
"assets/assets/Close.png": "422e50d161f6cc51c1c08be7925b7dbd"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
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

import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';


const addMarkers = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infowindow);
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const performances_DOM = document.getElementById("performances-column");
  const buttonSwitch_DOM = document.getElementById("button-switch-map");


  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    
    const markers = JSON.parse(mapElement.dataset.markers);
    
    fitMapToMarkers(map, markers);
    addMarkers(map, markers);
    
    map.on('load', function () {
      map.resize();
    });
    
    buttonSwitch_DOM.addEventListener("click", (event) => {
      performances_DOM.classList.toggle("d-none");
      mapElement.classList.toggle("d-none");
      // mapElement.classList.toggle("col-5");
      // mapElement.classList.toggle("col-12");
      if (buttonSwitch_DOM.innerHTML === "Map") {
        buttonSwitch_DOM.innerHTML = "List";
      } else {
        buttonSwitch_DOM.innerHTML = "Map";
      }
      map.resize();
    });
  }
};

export { initMapbox };


import { onMount } from "svelte";
import { browser } from "$app/environment";
const clientInfo = $state({
    isTouchscreen: false,
});

if(browser){
    clientInfo.isTouchscreen = window.matchMedia('(pointer: coarse)').matches;
}

export default clientInfo;
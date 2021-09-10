function previewImage() {
    const reader  = new FileReader();
    const file = document.querySelector('input[type="file"]');
    const preview = document.querySelector("#preview")
    const eventLog = document.querySelector('.event-log-contents');
    reader.onloadend = function (event) {
        eventLog.textContent = eventLog.textContent + `${event.type}: ${event.loaded} bytes transferred\n`;
        if(event.type === "load") {
            preview.src = reader.result;
        }
    }
    if (file) {
        reader.readAsDataURL(file);
    }
}
function validateInput() {
    var input = document.querySelector('.find-input').value.trim();
    if (!input) {
        alert('Please enter a search term.');
        return false;
    }
    return true;
}
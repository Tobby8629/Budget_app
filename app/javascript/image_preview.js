document.addEventListener('DOMContentLoaded', () => {
    const imageInput = document.getElementById('image-input');
    const imagePreview = document.getElementById('image-preview');
  
    imageInput.addEventListener('change', (e) => {
      const file = e.target.files[0];
      const reader = new FileReader();
  
      reader.onload = (event) => {
        imagePreview.src = event.target.result;
        imagePreview.style.display = 'block';
      };
  
      reader.readAsDataURL(file);
    });
  });
  
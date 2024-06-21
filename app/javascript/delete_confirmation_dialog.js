window.addEventListener(('turbo:load'), () => {
  document.addEventListener('submit', (event) => {
    if (event.target && event.target.className === 'delete-alertbox') {
      event.preventDefault()
      Swal.fire({
          title: 'Êtes-vous sûr ?',
          icon: 'error',
          showCancelButton: true,
          cancelButtonText: "Non",
          confirmButtonColor: '#219ebc',
          cancelButtonColor: '#f18940',
          confirmButtonText: 'Oui'
      })
        .then((result) => {
          if (result.isConfirmed) {
            document.querySelector('.delete-alertbox').submit()
          }
        })
        .catch(event.preventDefault())
    }
  })
})

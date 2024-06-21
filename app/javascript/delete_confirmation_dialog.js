window.addEventListener(('turbo:load'), () => {
  document.addEventListener('submit', (event) => {
    if (event.target && event.target.className === 'delete-alertbox') {
      event.preventDefault()
      Swal.fire({
          title: 'Vous refusez la demande de réservation ?',
          icon: 'error',
          showCancelButton: true,
          cancelButtonText: "Annuler",
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

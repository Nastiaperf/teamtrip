import Sortable from 'sortablejs';

const initSortable = () => {
  const list = document.querySelector('#results');
  Sortable.create(list, {
    ghostClass: "ghost",
    animation: 150,
    onEnd: (event) => {
      console.log(`${event.oldIndex} moved to ${event.newIndex}`);
      // console.log(event.item)
      const li = event.item
      const form = li.querySelector('form');
      const positionInput = li.querySelector('.new_position');

      positionInput.value = (Number.parseInt(positionInput.value) + (event.newIndex - event.oldIndex)).toString()

      if (event.newIndex !== event.oldIndex) {
        form.submit()
      }
    }
  });

  // element.addEventListener("click", (event) => {
  // event.currentTarget(form)

  // })

};

export { initSortable };
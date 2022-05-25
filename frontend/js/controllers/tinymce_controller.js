/* global Trestle, tinymce */

export default class extends Trestle.ApplicationController {
  connect () {
    tinymce.init({
      target: this.element,
      ...this.configuration
    })
  }

  disconnect () {
    const editor = tinymce.get(this.element.id)

    if (editor) {
      editor.remove()
    }
  }

  get configuration () {
    return Trestle.TinyMCE.default
  }
}

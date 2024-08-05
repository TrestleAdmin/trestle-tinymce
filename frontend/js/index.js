/* global Trestle, Stimulus */

import TinyMCEController from './controllers/tinymce_controller'

// Configuration container
Trestle.TinyMCE = {}

Stimulus.register('tinymce', TinyMCEController)

// Prevent Bootstrap dialog from blocking focusin
document.addEventListener('focusin', (e) => {
  if (e.target.closest(".tox-tinymce-aux, .moxman-window, .tam-assetmanager-root") !== null) {
    e.stopImmediatePropagation()
  }
})

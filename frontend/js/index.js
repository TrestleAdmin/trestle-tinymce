/* global Trestle, Stimulus */

import TinyMCEController from './controllers/tinymce_controller'

// Configuration container
Trestle.TinyMCE = {}

Stimulus.register('tinymce', TinyMCEController)

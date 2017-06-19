/*eslint-env node */

module.exports = function (grunt) {
  grunt.initConfig({
    less: {
      modern: {
        options: {
          cleancss: true,
          strictImports: true
        },

        expand: true,
        rename: function () {
          return "app/assets/javascripts/tinymce/skins/trestle/skin.min.css";
        },
        src: ["src/trestle/less/Skin.less"],
        dest: "app/assets/javascripts/tinymce/skins/trestle"
      },

      content: {
        options: {
          cleancss: true,
          strictImports: true
        },
        expand: true,
        rename: function () {
          return "app/assets/javascripts/tinymce/skins/trestle/content.min.css";
        },
        src: ["src/trestle/less/Content.less"],
        dest: "app/assets/javascripts/tinymce/skins/trestle"
      },

      "content-inline": {
        options: {
          cleancss: true,
          strictImports: true
        },
        expand: true,
        rename: function () {
          return "app/assets/javascripts/tinymce/skins/trestle/content.inline.min.css";
        },
        src: ["src/trestle/less/Content.Inline.less"],
        dest: "app/assets/javascripts/tinymce/skins/trestle"
      }
    },

    copy: {
      "plugin": {
        files: [
          {
            expand: true,
            flatten: true,
            cwd: "src/trestle/fonts",
            src: [
              "**",
              "!*.json",
              "!*.md"
            ],
            dest: "app/assets/javascripts/tinymce/skins/trestle/fonts"
          },
          {
            expand: true,
            flatten: true,
            cwd: "src/trestle/img",
            src: "**",
            dest: "app/assets/javascripts/tinymce/skins/trestle/img"
          }
        ]
      }
    }
  });

  grunt.task.loadNpmTasks("grunt-contrib-copy");
  grunt.task.loadNpmTasks("grunt-contrib-less");

  grunt.registerTask("default", ["less", "copy"]);
};

package org.androidaudioplugin.ports.juce.os251

import android.content.Context
import androidx.startup.Initializer
import java.io.File
import java.io.FileNotFoundException
import java.io.FileOutputStream

class Os251SetupInitializer : Initializer<Any> {

    private fun ensureDirectoryExists(dir: File) {
        if (dir.exists()) {
            require(dir.isDirectory) { "${dir.absolutePath} exists but is not a directory" }
            return
        }
        check(dir.mkdirs()) { "Failed to create directory: ${dir.absolutePath}" }
    }

    private fun xcopyFromAssetsToLocalStorage(context: Context, dst: File, src: String): Boolean {
        val list = context.assets.list(src).orEmpty()
        if (list.isNotEmpty()) {
            ensureDirectoryExists(dst)
            for (sub in list)
                xcopyFromAssetsToLocalStorage(context, File(dst, sub), "$src/$sub")
            return true
        } else {
            dst.parentFile?.let(::ensureDirectoryExists)
            return try {
                FileOutputStream(dst).use { w ->
                    context.assets.open(src).use { r -> r.copyTo(w) }
                }
                true
            } catch (_: FileNotFoundException) {
                false
            }
        }
    }

    override fun create(context: Context): Any {
        val presetDir = File(context.filesDir, "Onsen Audio/OS-251/presets")
        if (!presetDir.exists())
            xcopyFromAssetsToLocalStorage(context, presetDir, "OS-251/presets")
        return ""
    }

    override fun dependencies(): MutableList<Class<out Initializer<*>>> = mutableListOf()
}

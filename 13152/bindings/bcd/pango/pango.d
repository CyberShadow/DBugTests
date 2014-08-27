/* THIS FILE GENERATED BY bcd.gen */
module bcd.pango.pango;
align(4):
public import bcd.glib2.glib;
const int PANGO_SCALE = 1024;
enum PangoRenderPart {
PANGO_RENDER_PART_FOREGROUND=0,
PANGO_RENDER_PART_BACKGROUND=1,
PANGO_RENDER_PART_UNDERLINE=2,
PANGO_RENDER_PART_STRIKETHROUGH=3,
}
alias void PangoRendererPrivate;
alias _PangoRendererClass PangoRendererClass;
alias _PangoRenderer PangoRenderer;
alias void PangoFont;
alias _PangoGlyphString PangoGlyphString;
alias void function(_PangoRenderer *, void *, _PangoGlyphString *, int, int) _BCD_func__3442;
alias void function(_PangoRenderer *, int, int, int, int, int) _BCD_func__3443;
alias void function(_PangoRenderer *, int, int, int, int) _BCD_func__3444;
alias _PangoAttrShape PangoAttrShape;
alias void function(_PangoRenderer *, _PangoAttrShape *, int, int) _BCD_func__3445;
alias void function(_PangoRenderer *, int, double, double, double, double, double, double) _BCD_func__3446;
alias void function(_PangoRenderer *, void *, uint, double, double) _BCD_func__3447;
alias void function(_PangoRenderer *, int) _BCD_func__3448;
alias void function(_PangoRenderer *) _BCD_func__3449;
alias _PangoGlyphItem PangoGlyphItem;
alias _PangoGlyphItem PangoLayoutRun;
alias void function(_PangoRenderer *, _PangoGlyphItem *) _BCD_func__3450;
alias void function() _BCD_func__2609;
enum PangoUnderline {
PANGO_UNDERLINE_NONE=0,
PANGO_UNDERLINE_SINGLE=1,
PANGO_UNDERLINE_DOUBLE=2,
PANGO_UNDERLINE_LOW=3,
PANGO_UNDERLINE_ERROR=4,
}
alias _PangoMatrix PangoMatrix;
alias void PangoLayoutIter;
enum PangoEllipsizeMode {
PANGO_ELLIPSIZE_NONE=0,
PANGO_ELLIPSIZE_START=1,
PANGO_ELLIPSIZE_MIDDLE=2,
PANGO_ELLIPSIZE_END=3,
}
enum PangoWrapMode {
PANGO_WRAP_WORD=0,
PANGO_WRAP_CHAR=1,
PANGO_WRAP_WORD_CHAR=2,
}
enum PangoAlignment {
PANGO_ALIGN_LEFT=0,
PANGO_ALIGN_CENTER=1,
PANGO_ALIGN_RIGHT=2,
}
alias _PangoLayoutLine PangoLayoutLine;
alias void PangoLayout;
alias void PangoLayoutClass;
enum PangoTabAlign {
PANGO_TAB_LEFT=0,
}
alias void PangoTabArray;
alias _PangoItem PangoItem;
enum PangoScript {
PANGO_SCRIPT_INVALID_CODE=-1,
PANGO_SCRIPT_COMMON=0,
PANGO_SCRIPT_INHERITED=1,
PANGO_SCRIPT_ARABIC=2,
PANGO_SCRIPT_ARMENIAN=3,
PANGO_SCRIPT_BENGALI=4,
PANGO_SCRIPT_BOPOMOFO=5,
PANGO_SCRIPT_CHEROKEE=6,
PANGO_SCRIPT_COPTIC=7,
PANGO_SCRIPT_CYRILLIC=8,
PANGO_SCRIPT_DESERET=9,
PANGO_SCRIPT_DEVANAGARI=10,
PANGO_SCRIPT_ETHIOPIC=11,
PANGO_SCRIPT_GEORGIAN=12,
PANGO_SCRIPT_GOTHIC=13,
PANGO_SCRIPT_GREEK=14,
PANGO_SCRIPT_GUJARATI=15,
PANGO_SCRIPT_GURMUKHI=16,
PANGO_SCRIPT_HAN=17,
PANGO_SCRIPT_HANGUL=18,
PANGO_SCRIPT_HEBREW=19,
PANGO_SCRIPT_HIRAGANA=20,
PANGO_SCRIPT_KANNADA=21,
PANGO_SCRIPT_KATAKANA=22,
PANGO_SCRIPT_KHMER=23,
PANGO_SCRIPT_LAO=24,
PANGO_SCRIPT_LATIN=25,
PANGO_SCRIPT_MALAYALAM=26,
PANGO_SCRIPT_MONGOLIAN=27,
PANGO_SCRIPT_MYANMAR=28,
PANGO_SCRIPT_OGHAM=29,
PANGO_SCRIPT_OLD_ITALIC=30,
PANGO_SCRIPT_ORIYA=31,
PANGO_SCRIPT_RUNIC=32,
PANGO_SCRIPT_SINHALA=33,
PANGO_SCRIPT_SYRIAC=34,
PANGO_SCRIPT_TAMIL=35,
PANGO_SCRIPT_TELUGU=36,
PANGO_SCRIPT_THAANA=37,
PANGO_SCRIPT_THAI=38,
PANGO_SCRIPT_TIBETAN=39,
PANGO_SCRIPT_CANADIAN_ABORIGINAL=40,
PANGO_SCRIPT_YI=41,
PANGO_SCRIPT_TAGALOG=42,
PANGO_SCRIPT_HANUNOO=43,
PANGO_SCRIPT_BUHID=44,
PANGO_SCRIPT_TAGBANWA=45,
PANGO_SCRIPT_BRAILLE=46,
PANGO_SCRIPT_CYPRIOT=47,
PANGO_SCRIPT_LIMBU=48,
PANGO_SCRIPT_OSMANYA=49,
PANGO_SCRIPT_SHAVIAN=50,
PANGO_SCRIPT_LINEAR_B=51,
PANGO_SCRIPT_TAI_LE=52,
PANGO_SCRIPT_UGARITIC=53,
PANGO_SCRIPT_NEW_TAI_LUE=54,
PANGO_SCRIPT_BUGINESE=55,
PANGO_SCRIPT_GLAGOLITIC=56,
PANGO_SCRIPT_TIFINAGH=57,
PANGO_SCRIPT_SYLOTI_NAGRI=58,
PANGO_SCRIPT_OLD_PERSIAN=59,
PANGO_SCRIPT_KHAROSHTHI=60,
}
alias void PangoScriptIter;
alias int PangoGlyphUnit;
alias _PangoGlyphInfo PangoGlyphInfo;
alias uint PangoGlyph;
alias _PangoGlyphGeometry PangoGlyphGeometry;
alias _PangoGlyphVisAttr PangoGlyphVisAttr;
alias void PangoContextClass;
alias void PangoContext;
alias void PangoFontset;
alias int function(void *, void *, void *) _BCD_func__2281;
alias _BCD_func__2281 PangoFontsetForeachFunc;
alias _PangoAnalysis PangoAnalysis;
alias void PangoEngineShape;
alias void PangoEngineLang;
alias void PangoLanguage;
alias void * function(void *) _BCD_func__2305;
alias _BCD_func__2305 PangoAttrDataCopyFunc;
alias _PangoAttribute PangoAttribute;
alias int function(_PangoAttribute *, void *) _BCD_func__2306;
alias _BCD_func__2306 PangoAttrFilterFunc;
enum PangoAttrType {
PANGO_ATTR_INVALID=0,
PANGO_ATTR_LANGUAGE=1,
PANGO_ATTR_FAMILY=2,
PANGO_ATTR_STYLE=3,
PANGO_ATTR_WEIGHT=4,
PANGO_ATTR_VARIANT=5,
PANGO_ATTR_STRETCH=6,
PANGO_ATTR_SIZE=7,
PANGO_ATTR_FONT_DESC=8,
PANGO_ATTR_FOREGROUND=9,
PANGO_ATTR_BACKGROUND=10,
PANGO_ATTR_UNDERLINE=11,
PANGO_ATTR_STRIKETHROUGH=12,
PANGO_ATTR_RISE=13,
PANGO_ATTR_SHAPE=14,
PANGO_ATTR_SCALE=15,
PANGO_ATTR_FALLBACK=16,
PANGO_ATTR_LETTER_SPACING=17,
PANGO_ATTR_UNDERLINE_COLOR=18,
PANGO_ATTR_STRIKETHROUGH_COLOR=19,
PANGO_ATTR_ABSOLUTE_SIZE=20,
}
alias void PangoAttrIterator;
alias void PangoAttrList;
alias _PangoRectangle PangoRectangle;
alias void function(void *) _BCD_func__2694;
alias _PangoAttrFontDesc PangoAttrFontDesc;
alias void PangoFontDescription;
alias _PangoAttrColor PangoAttrColor;
alias _PangoColor PangoColor;
alias _PangoAttrFloat PangoAttrFloat;
alias _PangoAttrSize PangoAttrSize;
alias _PangoAttrInt PangoAttrInt;
alias _PangoAttrLanguage PangoAttrLanguage;
alias _PangoAttrString PangoAttrString;
alias _PangoAttrClass PangoAttrClass;
alias _PangoAttribute * function(_PangoAttribute *) _BCD_func__3469;
alias void function(_PangoAttribute *) _BCD_func__3470;
alias int function(_PangoAttribute *, _PangoAttribute *) _BCD_func__3471;
alias void PangoFontFace;
alias void PangoFontFamily;
enum PangoFontMask {
PANGO_FONT_MASK_FAMILY=1,
PANGO_FONT_MASK_STYLE=2,
PANGO_FONT_MASK_VARIANT=4,
PANGO_FONT_MASK_WEIGHT=8,
PANGO_FONT_MASK_STRETCH=16,
PANGO_FONT_MASK_SIZE=32,
}
enum PangoStretch {
PANGO_STRETCH_ULTRA_CONDENSED=0,
PANGO_STRETCH_EXTRA_CONDENSED=1,
PANGO_STRETCH_CONDENSED=2,
PANGO_STRETCH_SEMI_CONDENSED=3,
PANGO_STRETCH_NORMAL=4,
PANGO_STRETCH_SEMI_EXPANDED=5,
PANGO_STRETCH_EXPANDED=6,
PANGO_STRETCH_EXTRA_EXPANDED=7,
PANGO_STRETCH_ULTRA_EXPANDED=8,
}
enum PangoWeight {
PANGO_WEIGHT_ULTRALIGHT=200,
PANGO_WEIGHT_LIGHT=300,
PANGO_WEIGHT_NORMAL=400,
PANGO_WEIGHT_SEMIBOLD=600,
PANGO_WEIGHT_BOLD=700,
PANGO_WEIGHT_ULTRABOLD=800,
PANGO_WEIGHT_HEAVY=900,
}
enum PangoVariant {
PANGO_VARIANT_NORMAL=0,
PANGO_VARIANT_SMALL_CAPS=1,
}
enum PangoStyle {
PANGO_STYLE_NORMAL=0,
PANGO_STYLE_OBLIQUE=1,
PANGO_STYLE_ITALIC=2,
}
alias void PangoFontMetrics;
enum PangoDirection {
PANGO_DIRECTION_LTR=0,
PANGO_DIRECTION_RTL=1,
PANGO_DIRECTION_TTB_LTR=2,
PANGO_DIRECTION_TTB_RTL=3,
PANGO_DIRECTION_WEAK_LTR=4,
PANGO_DIRECTION_WEAK_RTL=5,
PANGO_DIRECTION_NEUTRAL=6,
}
alias void PangoFontMap;
alias _PangoLogAttr PangoLogAttr;
enum PangoCoverageLevel {
PANGO_COVERAGE_NONE=0,
PANGO_COVERAGE_FALLBACK=1,
PANGO_COVERAGE_APPROXIMATE=2,
PANGO_COVERAGE_EXACT=3,
}
alias void PangoCoverage;
extern (C) _PangoMatrix * pango_renderer_get_matrix(_PangoRenderer *);
extern (C) void pango_renderer_set_matrix(_PangoRenderer *, _PangoMatrix *);
extern (C) _PangoColor * pango_renderer_get_color(_PangoRenderer *, int);
extern (C) void pango_renderer_set_color(_PangoRenderer *, int, _PangoColor *);
extern (C) void pango_renderer_part_changed(_PangoRenderer *, int);
extern (C) void pango_renderer_deactivate(_PangoRenderer *);
extern (C) void pango_renderer_activate(_PangoRenderer *);
extern (C) void pango_renderer_draw_glyph(_PangoRenderer *, void *, uint, double, double);
extern (C) void pango_renderer_draw_trapezoid(_PangoRenderer *, int, double, double, double, double, double, double);
extern (C) void pango_renderer_draw_error_underline(_PangoRenderer *, int, int, int, int);
extern (C) void pango_renderer_draw_rectangle(_PangoRenderer *, int, int, int, int, int);
extern (C) void pango_renderer_draw_glyphs(_PangoRenderer *, void *, _PangoGlyphString *, int, int);
extern (C) void pango_renderer_draw_layout_line(_PangoRenderer *, _PangoLayoutLine *, int, int);
extern (C) void pango_renderer_draw_layout(_PangoRenderer *, void *, int, int);
extern (C) uint pango_renderer_get_type();
extern (C) int pango_layout_iter_get_baseline(void *);
extern (C) void pango_layout_iter_get_layout_extents(void *, _PangoRectangle *, _PangoRectangle *);
extern (C) void pango_layout_iter_get_line_yrange(void *, int *, int *);
extern (C) void pango_layout_iter_get_line_extents(void *, _PangoRectangle *, _PangoRectangle *);
extern (C) void pango_layout_iter_get_run_extents(void *, _PangoRectangle *, _PangoRectangle *);
extern (C) void pango_layout_iter_get_cluster_extents(void *, _PangoRectangle *, _PangoRectangle *);
extern (C) void pango_layout_iter_get_char_extents(void *, _PangoRectangle *);
extern (C) int pango_layout_iter_next_line(void *);
extern (C) int pango_layout_iter_next_run(void *);
extern (C) int pango_layout_iter_next_cluster(void *);
extern (C) int pango_layout_iter_next_char(void *);
extern (C) int pango_layout_iter_at_last_line(void *);
extern (C) _PangoLayoutLine * pango_layout_iter_get_line(void *);
extern (C) _PangoGlyphItem * pango_layout_iter_get_run(void *);
extern (C) int pango_layout_iter_get_index(void *);
extern (C) void pango_layout_iter_free(void *);
extern (C) void * pango_layout_get_iter(void *);
extern (C) uint pango_layout_iter_get_type();
extern (C) void pango_layout_line_get_pixel_extents(_PangoLayoutLine *, _PangoRectangle *, _PangoRectangle *);
extern (C) void pango_layout_line_get_extents(_PangoLayoutLine *, _PangoRectangle *, _PangoRectangle *);
extern (C) void pango_layout_line_get_x_ranges(_PangoLayoutLine *, int, int, int * *, int *);
extern (C) void pango_layout_line_index_to_x(_PangoLayoutLine *, int, int, int *);
extern (C) int pango_layout_line_x_to_index(_PangoLayoutLine *, int, int *, int *);
extern (C) void pango_layout_line_unref(_PangoLayoutLine *);
extern (C) _PangoLayoutLine * pango_layout_line_ref(_PangoLayoutLine *);
extern (C) uint pango_layout_line_get_type();
extern (C) _GSList * pango_layout_get_lines(void *);
extern (C) _PangoLayoutLine * pango_layout_get_line(void *, int);
extern (C) int pango_layout_get_line_count(void *);
extern (C) void pango_layout_get_pixel_size(void *, int *, int *);
extern (C) void pango_layout_get_size(void *, int *, int *);
extern (C) void pango_layout_get_pixel_extents(void *, _PangoRectangle *, _PangoRectangle *);
extern (C) void pango_layout_get_extents(void *, _PangoRectangle *, _PangoRectangle *);
extern (C) int pango_layout_xy_to_index(void *, int, int, int *, int *);
extern (C) void pango_layout_move_cursor_visually(void *, int, int, int, int, int *, int *);
extern (C) void pango_layout_get_cursor_pos(void *, int, _PangoRectangle *, _PangoRectangle *);
extern (C) void pango_layout_index_to_pos(void *, int, _PangoRectangle *);
extern (C) void pango_layout_get_log_attrs(void *, _PangoLogAttr * *, int *);
extern (C) void pango_layout_context_changed(void *);
extern (C) int pango_layout_get_ellipsize(void *);
extern (C) void pango_layout_set_ellipsize(void *, int);
extern (C) int pango_layout_get_single_paragraph_mode(void *);
extern (C) void pango_layout_set_single_paragraph_mode(void *, int);
extern (C) void * pango_layout_get_tabs(void *);
extern (C) void pango_layout_set_tabs(void *, void *);
extern (C) int pango_layout_get_alignment(void *);
extern (C) void pango_layout_set_alignment(void *, int);
extern (C) int pango_layout_get_auto_dir(void *);
extern (C) void pango_layout_set_auto_dir(void *, int);
extern (C) int pango_layout_get_justify(void *);
extern (C) void pango_layout_set_justify(void *, int);
extern (C) int pango_layout_get_spacing(void *);
extern (C) void pango_layout_set_spacing(void *, int);
extern (C) int pango_layout_get_indent(void *);
extern (C) void pango_layout_set_indent(void *, int);
extern (C) int pango_layout_get_wrap(void *);
extern (C) void pango_layout_set_wrap(void *, int);
extern (C) int pango_layout_get_width(void *);
extern (C) void pango_layout_set_width(void *, int);
extern (C) void * pango_layout_get_font_description(void *);
extern (C) void pango_layout_set_font_description(void *, void *);
extern (C) void pango_layout_set_markup_with_accel(void *, char *, int, uint, uint *);
extern (C) void pango_layout_set_markup(void *, char *, int);
extern (C) char * pango_layout_get_text(void *);
extern (C) void pango_layout_set_text(void *, char *, int);
extern (C) void * pango_layout_get_attributes(void *);
extern (C) void pango_layout_set_attributes(void *, void *);
extern (C) void * pango_layout_get_context(void *);
extern (C) void * pango_layout_copy(void *);
extern (C) void * pango_layout_new(void *);
extern (C) uint pango_layout_get_type();
extern (C) int pango_tab_array_get_positions_in_pixels(void *);
extern (C) void pango_tab_array_get_tabs(void *, int * *, int * *);
extern (C) void pango_tab_array_get_tab(void *, int, int *, int *);
extern (C) void pango_tab_array_set_tab(void *, int, int, int);
extern (C) void pango_tab_array_resize(void *, int);
extern (C) int pango_tab_array_get_size(void *);
extern (C) void pango_tab_array_free(void *);
extern (C) void * pango_tab_array_copy(void *);
extern (C) uint pango_tab_array_get_type();
extern (C) void * pango_tab_array_new_with_positions(int, int, int, int, ...);
extern (C) void * pango_tab_array_new(int, int);
extern (C) void pango_glyph_item_letter_space(_PangoGlyphItem *, char *, _PangoLogAttr *, int);
extern (C) _GSList * pango_glyph_item_apply_attrs(_PangoGlyphItem *, char *, void *);
extern (C) void pango_glyph_item_free(_PangoGlyphItem *);
extern (C) _PangoGlyphItem * pango_glyph_item_split(_PangoGlyphItem *, char *, int);
extern (C) uint pango_direction_get_type();
extern (C) uint pango_tab_align_get_type();
extern (C) uint pango_script_get_type();
extern (C) uint pango_render_part_get_type();
extern (C) uint pango_ellipsize_mode_get_type();
extern (C) uint pango_wrap_mode_get_type();
extern (C) uint pango_alignment_get_type();
extern (C) uint pango_font_mask_get_type();
extern (C) uint pango_stretch_get_type();
extern (C) uint pango_weight_get_type();
extern (C) uint pango_variant_get_type();
extern (C) uint pango_style_get_type();
extern (C) uint pango_coverage_level_get_type();
extern (C) uint pango_underline_get_type();
extern (C) uint pango_attr_type_get_type();
extern (C) int pango_language_includes_script(void *, int);
extern (C) void * pango_script_get_sample_language(int);
extern (C) void pango_script_iter_free(void *);
extern (C) int pango_script_iter_next(void *);
extern (C) void pango_script_iter_get_range(void *, char * *, char * *, int *);
extern (C) void * pango_script_iter_new(char *, int);
extern (C) int pango_script_for_unichar(uint);
extern (C) _GList * pango_reorder_items(_GList *);
extern (C) void pango_shape(char *, int, _PangoAnalysis *, _PangoGlyphString *);
extern (C) void pango_glyph_string_x_to_index(_PangoGlyphString *, char *, int, _PangoAnalysis *, int, int *, int *);
extern (C) void pango_glyph_string_index_to_x(_PangoGlyphString *, char *, int, _PangoAnalysis *, int, int, int *);
extern (C) void pango_glyph_string_get_logical_widths(_PangoGlyphString *, char *, int, int, int *);
extern (C) void pango_glyph_string_extents_range(_PangoGlyphString *, int, int, void *, _PangoRectangle *, _PangoRectangle *);
extern (C) void pango_glyph_string_extents(_PangoGlyphString *, void *, _PangoRectangle *, _PangoRectangle *);
extern (C) void pango_glyph_string_free(_PangoGlyphString *);
extern (C) _PangoGlyphString * pango_glyph_string_copy(_PangoGlyphString *);
extern (C) uint pango_glyph_string_get_type();
extern (C) void pango_glyph_string_set_size(_PangoGlyphString *, int);
extern (C) _PangoGlyphString * pango_glyph_string_new();
extern (C) _GList * pango_itemize_with_base_dir(void *, int, char *, int, int, void *, void *);
extern (C) _GList * pango_itemize(void *, char *, int, int, void *, void *);
extern (C) _PangoMatrix * pango_context_get_matrix(void *);
extern (C) void pango_context_set_matrix(void *, _PangoMatrix *);
extern (C) int pango_context_get_base_dir(void *);
extern (C) void pango_context_set_base_dir(void *, int);
extern (C) void pango_context_set_language(void *, void *);
extern (C) void * pango_context_get_language(void *);
extern (C) void * pango_context_get_font_description(void *);
extern (C) void pango_context_set_font_description(void *, void *);
extern (C) void * pango_context_get_metrics(void *, void *, void *);
extern (C) void * pango_context_load_fontset(void *, void *, void *);
extern (C) void * pango_context_load_font(void *, void *);
extern (C) void pango_context_list_families(void *, void * * *, int *);
extern (C) void * pango_context_get_font_map(void *);
extern (C) uint pango_context_get_type();
extern (C) void pango_font_map_list_families(void *, void * * *, int *);
extern (C) void * pango_font_map_load_fontset(void *, void *, void *, void *);
extern (C) void * pango_font_map_load_font(void *, void *, void *);
extern (C) uint pango_font_map_get_type();
extern (C) void pango_fontset_foreach(void *, _BCD_func__2281, void *);
extern (C) void * pango_fontset_get_metrics(void *);
extern (C) void * pango_fontset_get_font(void *, uint);
extern (C) uint pango_fontset_get_type();
extern (C) void pango_get_log_attrs(char *, int, int, void *, _PangoLogAttr *, int);
extern (C) void pango_find_paragraph_boundary(char *, int, int *, int *);
extern (C) void pango_break(char *, int, _PangoAnalysis *, _PangoLogAttr *, int);
extern (C) _PangoItem * pango_item_split(_PangoItem *, int, int);
extern (C) void pango_item_free(_PangoItem *);
extern (C) _PangoItem * pango_item_copy(_PangoItem *);
extern (C) _PangoItem * pango_item_new();
extern (C) uint pango_item_get_type();
extern (C) int pango_parse_markup(char *, int, uint, void * *, char * *, uint *, _GError * *);
extern (C) _GSList * pango_attr_iterator_get_attrs(void *);
extern (C) void pango_attr_iterator_get_font(void *, void *, void * *, _GSList * *);
extern (C) _PangoAttribute * pango_attr_iterator_get(void *, int);
extern (C) void pango_attr_iterator_destroy(void *);
extern (C) void * pango_attr_iterator_copy(void *);
extern (C) int pango_attr_iterator_next(void *);
extern (C) void pango_attr_iterator_range(void *, int *, int *);
extern (C) void * pango_attr_list_get_iterator(void *);
extern (C) void * pango_attr_list_filter(void *, _BCD_func__2306, void *);
extern (C) void pango_attr_list_splice(void *, void *, int, int);
extern (C) void pango_attr_list_change(void *, _PangoAttribute *);
extern (C) void pango_attr_list_insert_before(void *, _PangoAttribute *);
extern (C) void pango_attr_list_insert(void *, _PangoAttribute *);
extern (C) void * pango_attr_list_copy(void *);
extern (C) void pango_attr_list_unref(void *);
extern (C) void * pango_attr_list_ref(void *);
extern (C) void * pango_attr_list_new();
extern (C) uint pango_attr_list_get_type();
extern (C) _PangoAttribute * pango_attr_shape_new_with_data(_PangoRectangle *, _PangoRectangle *, void *, _BCD_func__2305, _BCD_func__2694);
extern (C) _PangoAttribute * pango_attr_shape_new(_PangoRectangle *, _PangoRectangle *);
extern (C) _PangoAttribute * pango_attr_letter_spacing_new(int);
extern (C) _PangoAttribute * pango_attr_fallback_new(int);
extern (C) _PangoAttribute * pango_attr_scale_new(double);
extern (C) _PangoAttribute * pango_attr_rise_new(int);
extern (C) _PangoAttribute * pango_attr_strikethrough_color_new(ushort, ushort, ushort);
extern (C) _PangoAttribute * pango_attr_strikethrough_new(int);
extern (C) _PangoAttribute * pango_attr_underline_color_new(ushort, ushort, ushort);
extern (C) _PangoAttribute * pango_attr_underline_new(int);
extern (C) _PangoAttribute * pango_attr_font_desc_new(void *);
extern (C) _PangoAttribute * pango_attr_stretch_new(int);
extern (C) _PangoAttribute * pango_attr_variant_new(int);
extern (C) _PangoAttribute * pango_attr_weight_new(int);
extern (C) _PangoAttribute * pango_attr_style_new(int);
extern (C) _PangoAttribute * pango_attr_size_new_absolute(int);
extern (C) _PangoAttribute * pango_attr_size_new(int);
extern (C) _PangoAttribute * pango_attr_background_new(ushort, ushort, ushort);
extern (C) _PangoAttribute * pango_attr_foreground_new(ushort, ushort, ushort);
extern (C) _PangoAttribute * pango_attr_family_new(char *);
extern (C) _PangoAttribute * pango_attr_language_new(void *);
extern (C) int pango_attribute_equal(_PangoAttribute *, _PangoAttribute *);
extern (C) void pango_attribute_destroy(_PangoAttribute *);
extern (C) _PangoAttribute * pango_attribute_copy(_PangoAttribute *);
extern (C) int pango_attr_type_register(char *);
extern (C) int pango_color_parse(_PangoColor *, char *);
extern (C) void pango_color_free(_PangoColor *);
extern (C) _PangoColor * pango_color_copy(_PangoColor *);
extern (C) uint pango_color_get_type();
extern (C) void * pango_font_get_font_map(void *);
extern (C) void pango_font_get_glyph_extents(void *, uint, _PangoRectangle *, _PangoRectangle *);
extern (C) void * pango_font_get_metrics(void *, void *);
extern (C) void * pango_font_find_shaper(void *, void *, uint);
extern (C) void * pango_font_get_coverage(void *, void *);
extern (C) void * pango_font_describe(void *);
extern (C) uint pango_font_get_type();
extern (C) void pango_font_face_list_sizes(void *, int * *, int *);
extern (C) char * pango_font_face_get_face_name(void *);
extern (C) void * pango_font_face_describe(void *);
extern (C) uint pango_font_face_get_type();
extern (C) int pango_font_family_is_monospace(void *);
extern (C) char * pango_font_family_get_name(void *);
extern (C) void pango_font_family_list_faces(void *, void * * *, int *);
extern (C) uint pango_font_family_get_type();
extern (C) int pango_font_metrics_get_strikethrough_thickness(void *);
extern (C) int pango_font_metrics_get_strikethrough_position(void *);
extern (C) int pango_font_metrics_get_underline_thickness(void *);
extern (C) int pango_font_metrics_get_underline_position(void *);
extern (C) int pango_font_metrics_get_approximate_digit_width(void *);
extern (C) int pango_font_metrics_get_approximate_char_width(void *);
extern (C) int pango_font_metrics_get_descent(void *);
extern (C) int pango_font_metrics_get_ascent(void *);
extern (C) void pango_font_metrics_unref(void *);
extern (C) void * pango_font_metrics_ref(void *);
extern (C) uint pango_font_metrics_get_type();
extern (C) char * pango_font_description_to_filename(void *);
extern (C) char * pango_font_description_to_string(void *);
extern (C) void * pango_font_description_from_string(char *);
extern (C) int pango_font_description_better_match(void *, void *, void *);
extern (C) void pango_font_description_merge_static(void *, void *, int);
extern (C) void pango_font_description_merge(void *, void *, int);
extern (C) void pango_font_description_unset_fields(void *, int);
extern (C) int pango_font_description_get_set_fields(void *);
extern (C) int pango_font_description_get_size_is_absolute(void *);
extern (C) void pango_font_description_set_absolute_size(void *, double);
extern (C) int pango_font_description_get_size(void *);
extern (C) void pango_font_description_set_size(void *, int);
extern (C) int pango_font_description_get_stretch(void *);
extern (C) void pango_font_description_set_stretch(void *, int);
extern (C) int pango_font_description_get_weight(void *);
extern (C) void pango_font_description_set_weight(void *, int);
extern (C) int pango_font_description_get_variant(void *);
extern (C) void pango_font_description_set_variant(void *, int);
extern (C) int pango_font_description_get_style(void *);
extern (C) void pango_font_description_set_style(void *, int);
extern (C) char * pango_font_description_get_family(void *);
extern (C) void pango_font_description_set_family_static(void *, char *);
extern (C) void pango_font_description_set_family(void *, char *);
extern (C) void pango_font_descriptions_free(void * *, int);
extern (C) void pango_font_description_free(void *);
extern (C) int pango_font_description_equal(void *, void *);
extern (C) uint pango_font_description_hash(void *);
extern (C) void * pango_font_description_copy_static(void *);
extern (C) void * pango_font_description_copy(void *);
extern (C) void * pango_font_description_new();
extern (C) uint pango_font_description_get_type();
extern (C) int pango_find_base_dir(char *, int);
extern (C) int pango_unichar_direction(uint);
extern (C) int pango_get_mirror_char(uint, uint *);
extern (C) int pango_language_matches(void *, char *);
extern (C) void * pango_language_from_string(char *);
extern (C) uint pango_language_get_type();
extern (C) void pango_matrix_concat(_PangoMatrix *, _PangoMatrix *);
extern (C) void pango_matrix_rotate(_PangoMatrix *, double);
extern (C) void pango_matrix_scale(_PangoMatrix *, double, double);
extern (C) void pango_matrix_translate(_PangoMatrix *, double, double);
extern (C) void pango_matrix_free(_PangoMatrix *);
extern (C) _PangoMatrix * pango_matrix_copy(_PangoMatrix *);
extern (C) uint pango_matrix_get_type();
extern (C) void * pango_coverage_from_bytes(char *, int);
extern (C) void pango_coverage_to_bytes(void *, char * *, int *);
extern (C) void pango_coverage_max(void *, void *);
extern (C) void pango_coverage_set(void *, int, int);
extern (C) int pango_coverage_get(void *, int);
extern (C) void * pango_coverage_copy(void *);
extern (C) void pango_coverage_unref(void *);
extern (C) void * pango_coverage_ref(void *);
extern (C) void * pango_coverage_new();
alias void function(void *, uint, uint, _GInterfaceInfo *) _BCD_func__2407;
alias void function(void *, uint, _GTypeInfo *, _GTypeValueTable *) _BCD_func__2408;
alias void function(void *) _BCD_func__2409;
alias void function(void *, _GObject *, int) _BCD_func__2553;
alias void function(void *, _GObject *) _BCD_func__2559;
alias void function(_GObject *) _BCD_func__2560;
alias void function(_GObject *, uint, _GValue *, _GParamSpec *) _BCD_func__2561;
alias void function(_GObject *, uint, _GValue *, _GParamSpec *) _BCD_func__2562;
alias int function(_GSignalInvocationHint *, _GValue *, _GValue *, void *) _BCD_func__2587;
alias int function(_GSignalInvocationHint *, uint, _GValue *, void *) _BCD_func__2588;
alias void function(_GClosure *, _GValue *, uint, _GValue *, void *, void *) _BCD_func__2589;
alias void function(void *, _GClosure *) _BCD_func__2608;
alias void function(_GValue *, _GValue *) _BCD_func__2666;
alias void * function(void *) _BCD_func__2695;
alias void function(void *, void *) _BCD_func__2699;
alias int function(void *, _GTypeClass *) _BCD_func__2700;
alias void function(_GTypeInstance *, void *) _BCD_func__2701;
alias int function(void *, void *, void *) _BCD_func__2757;
alias void function(_GScanner *, char *, int) _BCD_func__2773;
alias void function(void *, void *, void *, _GError * *) _BCD_func__2857;
alias int function(void *, void *, void *, _GError * *) _BCD_func__2858;
alias int function(char *, char *, void *, _GError * *) _BCD_func__2859;
alias void * function(void *, void *) _BCD_func__2871;
alias void function(_GNode *, void *) _BCD_func__2872;
alias int function(_GNode *, void *) _BCD_func__2873;
alias void function(char *) _BCD_func__2881;
alias void function(char *, int, char *, void *) _BCD_func__2883;
alias int function(_GIOChannel *, int, void *) _BCD_func__2900;
alias int function(_GPollFD *, uint, int) _BCD_func__2964;
alias void function(int, int, void *) _BCD_func__2970;
alias int function(void *) _BCD_func__2971;
alias void function(_GHookList *, _GHook *) _BCD_func__3006;
alias int function(_GHook *, void *) _BCD_func__3007;
alias void function(_GHook *, void *) _BCD_func__3008;
alias int function(_GHook *, _GHook *) _BCD_func__3009;
alias void function(uint, void *, void *) _BCD_func__3043;
alias int function(char *, char *, uint) _BCD_func__3046;
alias char * function(void *) _BCD_func__3047;
alias char * function(char *, void *) _BCD_func__3168;
alias void function(void *, void *, void *) _BCD_func__3169;
alias uint function(void *) _BCD_func__3170;
alias int function(void *, void *) _BCD_func__3171;
alias int function(void *, void *, void *) _BCD_func__3172;
alias int function(void *, void *) _BCD_func__3173;
struct _PangoRendererClass {
_GObjectClass parent_class;
_BCD_func__3442 draw_glyphs;
_BCD_func__3443 draw_rectangle;
_BCD_func__3444 draw_error_underline;
_BCD_func__3445 draw_shape;
_BCD_func__3446 draw_trapezoid;
_BCD_func__3447 draw_glyph;
_BCD_func__3448 part_changed;
_BCD_func__3449 begin;
_BCD_func__3449 end;
_BCD_func__3450 prepare_run;
_BCD_func__2609 _pango_reserved1;
_BCD_func__2609 _pango_reserved2;
_BCD_func__2609 _pango_reserved3;
_BCD_func__2609 _pango_reserved4;
}
struct _PangoRenderer {
_GObject parent_instance;
int underline;
int strikethrough;
int active_count;
_PangoMatrix * matrix;
void * priv;
}
struct _PangoLayoutLine {
void * layout;
int start_index;
int length;
_GSList * runs;
uint is_paragraph_start;
uint resolved_dir;
}
struct _PangoGlyphItem {
_PangoItem * item;
_PangoGlyphString * glyphs;
}
struct _PangoGlyphString {
int num_glyphs;
_PangoGlyphInfo * glyphs;
int * log_clusters;
int space;
}
struct _PangoGlyphInfo {
uint glyph;
_PangoGlyphGeometry geometry;
_PangoGlyphVisAttr attr;
}
struct _PangoGlyphVisAttr {
uint is_cluster_start;
}
struct _PangoGlyphGeometry {
int width;
int x_offset;
int y_offset;
}
struct _PangoItem {
int offset;
int length;
int num_chars;
_PangoAnalysis analysis;
}
struct _PangoAnalysis {
void * shape_engine;
void * lang_engine;
void * font;
char level;
void * language;
_GSList * extra_attrs;
}
struct _PangoAttrShape {
_PangoAttribute attr;
_PangoRectangle ink_rect;
_PangoRectangle logical_rect;
void * data;
_BCD_func__2305 copy_func;
_BCD_func__2694 destroy_func;
}
struct _PangoAttrFontDesc {
_PangoAttribute attr;
void * desc;
}
struct _PangoAttrColor {
_PangoAttribute attr;
_PangoColor color;
}
struct _PangoAttrFloat {
_PangoAttribute attr;
double value;
}
struct _PangoAttrSize {
_PangoAttribute attr;
int size;
uint absolute;
}
struct _PangoAttrInt {
_PangoAttribute attr;
int value;
}
struct _PangoAttrLanguage {
_PangoAttribute attr;
void * value;
}
struct _PangoAttrString {
_PangoAttribute attr;
char * value;
}
struct _PangoAttrClass {
int type;
_BCD_func__3469 copy;
_BCD_func__3470 destroy;
_BCD_func__3471 equal;
}
struct _PangoAttribute {
_PangoAttrClass * klass;
uint start_index;
uint end_index;
}
struct _PangoColor {
ushort red;
ushort green;
ushort blue;
}
struct _PangoRectangle {
int x;
int y;
int width;
int height;
}
struct _PangoMatrix {
double xx;
double xy;
double yx;
double yy;
double x0;
double y0;
}
struct _PangoLogAttr {
uint is_line_break;
uint is_mandatory_break;
uint is_char_break;
uint is_white;
uint is_cursor_position;
uint is_word_start;
uint is_word_end;
uint is_sentence_boundary;
uint is_sentence_start;
uint is_sentence_end;
uint backspace_deletes_character;
}

/* THIS FILE GENERATED BY bcd.gen */
module bcd.atk.atk;
align(4):
public import bcd.glib2.glib;
alias _AtkValueIface AtkValueIface;
alias void AtkValue;
alias void function(void *, _GValue *) _BCD_func__3648;
alias int function(void *, _GValue *) _BCD_func__3649;
alias int function(void *) _BCD_func__2450;
alias _BCD_func__2450 AtkFunction;
alias _AtkTableIface AtkTableIface;
alias _AtkObject AtkObject;
alias void AtkTable;
alias _AtkObject * function(void *, int, int) _BCD_func__3651;
alias int function(void *, int, int) _BCD_func__3652;
alias int function(void *, int) _BCD_func__3653;
alias int function(void *) _BCD_func__3654;
alias _AtkObject * function(void *) _BCD_func__3655;
alias char * function(void *, int) _BCD_func__3656;
alias _AtkObject * function(void *, int) _BCD_func__3657;
alias void function(void *, _AtkObject *) _BCD_func__3658;
alias void function(void *, int, char *) _BCD_func__3659;
alias void function(void *, int, _AtkObject *) _BCD_func__3660;
alias int function(void *, int * *) _BCD_func__3661;
alias int function(void *, int) _BCD_func__3662;
alias int function(void *, int, int) _BCD_func__3663;
alias void function(void *, int, int) _BCD_func__3664;
alias void function(void *) _BCD_func__3665;
alias _AtkStreamableContentIface AtkStreamableContentIface;
alias void AtkStreamableContent;
alias int function(void *) _BCD_func__3667;
alias char * function(void *, int) _BCD_func__3668;
alias _GIOChannel * function(void *, char *) _BCD_func__3669;
alias _AtkStateSetClass AtkStateSetClass;
alias _AtkSelectionIface AtkSelectionIface;
alias void AtkSelection;
alias int function(void *, int) _BCD_func__3672;
alias int function(void *) _BCD_func__3673;
alias _AtkObject * function(void *, int) _BCD_func__3674;
alias int function(void *) _BCD_func__3675;
alias void function(void *) _BCD_func__3676;
alias _AtkRelationSetClass AtkRelationSetClass;
alias _AtkRelationClass AtkRelationClass;
alias _AtkRelation AtkRelation;
enum AtkRelationType {
ATK_RELATION_NULL=0,
ATK_RELATION_CONTROLLED_BY=1,
ATK_RELATION_CONTROLLER_FOR=2,
ATK_RELATION_LABEL_FOR=3,
ATK_RELATION_LABELLED_BY=4,
ATK_RELATION_MEMBER_OF=5,
ATK_RELATION_NODE_CHILD_OF=6,
ATK_RELATION_FLOWS_TO=7,
ATK_RELATION_FLOWS_FROM=8,
ATK_RELATION_SUBWINDOW_OF=9,
ATK_RELATION_EMBEDS=10,
ATK_RELATION_EMBEDDED_BY=11,
ATK_RELATION_POPUP_FOR=12,
ATK_RELATION_PARENT_WINDOW_OF=13,
ATK_RELATION_LAST_DEFINED=14,
}
alias _AtkRegistryClass AtkRegistryClass;
alias _AtkRegistry AtkRegistry;
alias _AtkNoOpObjectFactoryClass AtkNoOpObjectFactoryClass;
alias _AtkObjectFactoryClass AtkObjectFactoryClass;
alias _AtkNoOpObjectFactory AtkNoOpObjectFactory;
alias _AtkObjectFactory AtkObjectFactory;
alias _AtkObject * function(_GObject *) _BCD_func__3685;
alias void function(_AtkObjectFactory *) _BCD_func__3686;
alias uint function() _BCD_func__3687;
alias _AtkNoOpObjectClass AtkNoOpObjectClass;
alias _AtkObjectClass AtkObjectClass;
alias _AtkNoOpObject AtkNoOpObject;
alias _AtkImageIface AtkImageIface;
alias void AtkImage;
enum AtkCoordType {
ATK_XY_SCREEN=0,
ATK_XY_WINDOW=1,
}
alias void function(void *, int *, int *, int) _BCD_func__3692;
alias char * function(void *) _BCD_func__3693;
alias void function(void *, int *, int *) _BCD_func__3694;
alias int function(void *, char *) _BCD_func__3695;
alias _AtkHypertextIface AtkHypertextIface;
alias _AtkHyperlink AtkHyperlink;
alias void AtkHypertext;
alias _AtkHyperlink * function(void *, int) _BCD_func__3697;
alias int function(void *) _BCD_func__3698;
alias int function(void *, int) _BCD_func__3699;
alias void function(void *, int) _BCD_func__3700;
alias _AtkHyperlinkClass AtkHyperlinkClass;
alias char * function(_AtkHyperlink *, int) _BCD_func__3702;
alias _AtkObject * function(_AtkHyperlink *, int) _BCD_func__3703;
alias int function(_AtkHyperlink *) _BCD_func__3704;
alias int function(_AtkHyperlink *) _BCD_func__3705;
alias uint function(_AtkHyperlink *) _BCD_func__3706;
alias void function(_AtkHyperlink *) _BCD_func__3707;
enum AtkHyperlinkStateFlags {
ATK_HYPERLINK_IS_INLINE=1,
}
alias _AtkGObjectAccessibleClass AtkGObjectAccessibleClass;
alias _AtkGObjectAccessible AtkGObjectAccessible;
alias _AtkEditableTextIface AtkEditableTextIface;
alias void AtkEditableText;
alias _GSList AtkAttributeSet;
alias int function(void *, _GSList *, int, int) _BCD_func__3712;
alias void function(void *, char *) _BCD_func__3713;
alias void function(void *, char *, int, int *) _BCD_func__3714;
alias void function(void *, int, int) _BCD_func__3715;
alias void function(void *, int) _BCD_func__3716;
enum AtkTextClipType {
ATK_TEXT_CLIP_NONE=0,
ATK_TEXT_CLIP_MIN=1,
ATK_TEXT_CLIP_MAX=2,
ATK_TEXT_CLIP_BOTH=3,
}
alias _AtkTextRange AtkTextRange;
alias _AtkTextRectangle AtkTextRectangle;
enum AtkTextBoundary {
ATK_TEXT_BOUNDARY_CHAR=0,
ATK_TEXT_BOUNDARY_WORD_START=1,
ATK_TEXT_BOUNDARY_WORD_END=2,
ATK_TEXT_BOUNDARY_SENTENCE_START=3,
ATK_TEXT_BOUNDARY_SENTENCE_END=4,
ATK_TEXT_BOUNDARY_LINE_START=5,
ATK_TEXT_BOUNDARY_LINE_END=6,
}
alias _AtkTextIface AtkTextIface;
alias void AtkText;
alias char * function(void *, int, int) _BCD_func__3720;
alias char * function(void *, int, int, int *, int *) _BCD_func__3721;
alias uint function(void *, int) _BCD_func__3722;
alias int function(void *) _BCD_func__3723;
alias _GSList * function(void *, int, int *, int *) _BCD_func__3724;
alias _GSList * function(void *) _BCD_func__3725;
alias void function(void *, int, int *, int *, int *, int *, int) _BCD_func__3726;
alias int function(void *, int, int, int) _BCD_func__3727;
alias char * function(void *, int, int *, int *) _BCD_func__3728;
alias int function(void *, int, int) _BCD_func__3729;
alias int function(void *, int) _BCD_func__3730;
alias int function(void *, int, int, int) _BCD_func__3731;
alias void function(void *, int, int) _BCD_func__3732;
alias void function(void *, int) _BCD_func__3733;
alias void function(void *) _BCD_func__3734;
alias void function(void *, int, int, int, _AtkTextRectangle *) _BCD_func__3735;
alias _AtkTextRange * * function(void *, _AtkTextRectangle *, int, int, int) _BCD_func__3736;
enum AtkTextAttribute {
ATK_TEXT_ATTR_INVALID=0,
ATK_TEXT_ATTR_LEFT_MARGIN=1,
ATK_TEXT_ATTR_RIGHT_MARGIN=2,
ATK_TEXT_ATTR_INDENT=3,
ATK_TEXT_ATTR_INVISIBLE=4,
ATK_TEXT_ATTR_EDITABLE=5,
ATK_TEXT_ATTR_PIXELS_ABOVE_LINES=6,
ATK_TEXT_ATTR_PIXELS_BELOW_LINES=7,
ATK_TEXT_ATTR_PIXELS_INSIDE_WRAP=8,
ATK_TEXT_ATTR_BG_FULL_HEIGHT=9,
ATK_TEXT_ATTR_RISE=10,
ATK_TEXT_ATTR_UNDERLINE=11,
ATK_TEXT_ATTR_STRIKETHROUGH=12,
ATK_TEXT_ATTR_SIZE=13,
ATK_TEXT_ATTR_SCALE=14,
ATK_TEXT_ATTR_WEIGHT=15,
ATK_TEXT_ATTR_LANGUAGE=16,
ATK_TEXT_ATTR_FAMILY_NAME=17,
ATK_TEXT_ATTR_BG_COLOR=18,
ATK_TEXT_ATTR_FG_COLOR=19,
ATK_TEXT_ATTR_BG_STIPPLE=20,
ATK_TEXT_ATTR_FG_STIPPLE=21,
ATK_TEXT_ATTR_WRAP_MODE=22,
ATK_TEXT_ATTR_DIRECTION=23,
ATK_TEXT_ATTR_JUSTIFICATION=24,
ATK_TEXT_ATTR_STRETCH=25,
ATK_TEXT_ATTR_VARIANT=26,
ATK_TEXT_ATTR_STYLE=27,
ATK_TEXT_ATTR_LAST_DEFINED=28,
}
alias _AtkAttribute AtkAttribute;
alias _AtkDocumentIface AtkDocumentIface;
alias void AtkDocument;
alias char * function(void *) _BCD_func__3740;
alias void * function(void *) _BCD_func__3741;
alias _AtkRectangle AtkRectangle;
alias void function(_AtkObject *, int) _BCD_func__2391;
alias _BCD_func__2391 AtkFocusHandler;
alias _AtkComponentIface AtkComponentIface;
alias void AtkComponent;
alias uint function(void *, _BCD_func__2391) _BCD_func__3744;
alias int function(void *, int, int, int) _BCD_func__3745;
alias _AtkObject * function(void *, int, int, int) _BCD_func__3746;
alias void function(void *, int *, int *, int *, int *, int) _BCD_func__3747;
alias void function(void *, int *, int *, int) _BCD_func__3748;
alias void function(void *, int *, int *) _BCD_func__3749;
alias int function(void *) _BCD_func__3750;
alias void function(void *, uint) _BCD_func__3751;
alias int function(void *, int, int, int, int, int) _BCD_func__3752;
alias int function(void *, int, int) _BCD_func__3753;
enum AtkLayer {
ATK_LAYER_INVALID=0,
ATK_LAYER_BACKGROUND=1,
ATK_LAYER_CANVAS=2,
ATK_LAYER_WIDGET=3,
ATK_LAYER_MDI=4,
ATK_LAYER_POPUP=5,
ATK_LAYER_OVERLAY=6,
ATK_LAYER_WINDOW=7,
}
alias int function(void *) _BCD_func__3754;
alias int function(void *) _BCD_func__3755;
alias void function(void *, _AtkRectangle *) _BCD_func__3756;
enum AtkKeyEventType {
ATK_KEY_EVENT_PRESS=0,
ATK_KEY_EVENT_RELEASE=1,
ATK_KEY_EVENT_LAST_DEFINED=2,
}
alias _AtkKeyEventStruct AtkKeyEventStruct;
alias int function(_AtkKeyEventStruct *, void *) _BCD_func__2410;
alias _BCD_func__2410 AtkKeySnoopFunc;
alias void function() _BCD_func__2411;
alias _BCD_func__2411 AtkEventListenerInit;
alias void function(_AtkObject *) _BCD_func__2412;
alias _BCD_func__2412 AtkEventListener;
alias _AtkUtilClass AtkUtilClass;
alias int function(_GSignalInvocationHint *, uint, _GValue *, void *) _BCD_func__2697;
alias uint function(_BCD_func__2697, char *) _BCD_func__3759;
alias void function(uint) _BCD_func__3760;
alias uint function(_BCD_func__2410, void *) _BCD_func__3761;
alias _AtkObject * function() _BCD_func__3762;
alias char * function() _BCD_func__3763;
alias _AtkUtil AtkUtil;
alias _AtkActionIface AtkActionIface;
alias void AtkAction;
alias int function(void *, int) _BCD_func__3766;
alias int function(void *) _BCD_func__3767;
alias char * function(void *, int) _BCD_func__3768;
alias int function(void *, int, char *) _BCD_func__3769;
alias _AtkPropertyValues AtkPropertyValues;
alias void function(_AtkObject *, _AtkPropertyValues *) _BCD_func__2449;
alias _BCD_func__2449 AtkPropertyChangeHandler;
alias _AtkStateSet AtkStateSet;
alias _AtkRelationSet AtkRelationSet;
alias char * function(_AtkObject *) _BCD_func__3774;
alias _AtkObject * function(_AtkObject *) _BCD_func__3775;
alias int function(_AtkObject *) _BCD_func__3776;
alias _AtkObject * function(_AtkObject *, int) _BCD_func__3777;
alias _AtkRelationSet * function(_AtkObject *) _BCD_func__3778;
enum AtkRole {
ATK_ROLE_INVALID=0,
ATK_ROLE_ACCEL_LABEL=1,
ATK_ROLE_ALERT=2,
ATK_ROLE_ANIMATION=3,
ATK_ROLE_ARROW=4,
ATK_ROLE_CALENDAR=5,
ATK_ROLE_CANVAS=6,
ATK_ROLE_CHECK_BOX=7,
ATK_ROLE_CHECK_MENU_ITEM=8,
ATK_ROLE_COLOR_CHOOSER=9,
ATK_ROLE_COLUMN_HEADER=10,
ATK_ROLE_COMBO_BOX=11,
ATK_ROLE_DATE_EDITOR=12,
ATK_ROLE_DESKTOP_ICON=13,
ATK_ROLE_DESKTOP_FRAME=14,
ATK_ROLE_DIAL=15,
ATK_ROLE_DIALOG=16,
ATK_ROLE_DIRECTORY_PANE=17,
ATK_ROLE_DRAWING_AREA=18,
ATK_ROLE_FILE_CHOOSER=19,
ATK_ROLE_FILLER=20,
ATK_ROLE_FONT_CHOOSER=21,
ATK_ROLE_FRAME=22,
ATK_ROLE_GLASS_PANE=23,
ATK_ROLE_HTML_CONTAINER=24,
ATK_ROLE_ICON=25,
ATK_ROLE_IMAGE=26,
ATK_ROLE_INTERNAL_FRAME=27,
ATK_ROLE_LABEL=28,
ATK_ROLE_LAYERED_PANE=29,
ATK_ROLE_LIST=30,
ATK_ROLE_LIST_ITEM=31,
ATK_ROLE_MENU=32,
ATK_ROLE_MENU_BAR=33,
ATK_ROLE_MENU_ITEM=34,
ATK_ROLE_OPTION_PANE=35,
ATK_ROLE_PAGE_TAB=36,
ATK_ROLE_PAGE_TAB_LIST=37,
ATK_ROLE_PANEL=38,
ATK_ROLE_PASSWORD_TEXT=39,
ATK_ROLE_POPUP_MENU=40,
ATK_ROLE_PROGRESS_BAR=41,
ATK_ROLE_PUSH_BUTTON=42,
ATK_ROLE_RADIO_BUTTON=43,
ATK_ROLE_RADIO_MENU_ITEM=44,
ATK_ROLE_ROOT_PANE=45,
ATK_ROLE_ROW_HEADER=46,
ATK_ROLE_SCROLL_BAR=47,
ATK_ROLE_SCROLL_PANE=48,
ATK_ROLE_SEPARATOR=49,
ATK_ROLE_SLIDER=50,
ATK_ROLE_SPLIT_PANE=51,
ATK_ROLE_SPIN_BUTTON=52,
ATK_ROLE_STATUSBAR=53,
ATK_ROLE_TABLE=54,
ATK_ROLE_TABLE_CELL=55,
ATK_ROLE_TABLE_COLUMN_HEADER=56,
ATK_ROLE_TABLE_ROW_HEADER=57,
ATK_ROLE_TEAR_OFF_MENU_ITEM=58,
ATK_ROLE_TERMINAL=59,
ATK_ROLE_TEXT=60,
ATK_ROLE_TOGGLE_BUTTON=61,
ATK_ROLE_TOOL_BAR=62,
ATK_ROLE_TOOL_TIP=63,
ATK_ROLE_TREE=64,
ATK_ROLE_TREE_TABLE=65,
ATK_ROLE_UNKNOWN=66,
ATK_ROLE_VIEWPORT=67,
ATK_ROLE_WINDOW=68,
ATK_ROLE_HEADER=69,
ATK_ROLE_FOOTER=70,
ATK_ROLE_PARAGRAPH=71,
ATK_ROLE_RULER=72,
ATK_ROLE_APPLICATION=73,
ATK_ROLE_AUTOCOMPLETE=74,
ATK_ROLE_EDITBAR=75,
ATK_ROLE_EMBEDDED=76,
ATK_ROLE_LAST_DEFINED=77,
}
alias int function(_AtkObject *) _BCD_func__3779;
alias int function(_AtkObject *) _BCD_func__3780;
alias _AtkStateSet * function(_AtkObject *) _BCD_func__3781;
alias void function(_AtkObject *, char *) _BCD_func__3782;
alias void function(_AtkObject *, _AtkObject *) _BCD_func__3783;
alias void function(_AtkObject *, int) _BCD_func__3784;
alias uint function(_AtkObject *, _BCD_func__2449 *) _BCD_func__3785;
alias void function(_AtkObject *, uint) _BCD_func__3786;
alias void function(_AtkObject *, void *) _BCD_func__3787;
alias void function(_AtkObject *, uint, void *) _BCD_func__3788;
alias void function(_AtkObject *, char *, int) _BCD_func__3789;
alias void function(_AtkObject *, void * *) _BCD_func__3790;
alias _AtkImplementorIface AtkImplementorIface;
alias void AtkImplementor;
alias _AtkObject * function(void *) _BCD_func__3793;
alias ulong AtkState;
enum AtkStateType {
ATK_STATE_INVALID=0,
ATK_STATE_ACTIVE=1,
ATK_STATE_ARMED=2,
ATK_STATE_BUSY=3,
ATK_STATE_CHECKED=4,
ATK_STATE_DEFUNCT=5,
ATK_STATE_EDITABLE=6,
ATK_STATE_ENABLED=7,
ATK_STATE_EXPANDABLE=8,
ATK_STATE_EXPANDED=9,
ATK_STATE_FOCUSABLE=10,
ATK_STATE_FOCUSED=11,
ATK_STATE_HORIZONTAL=12,
ATK_STATE_ICONIFIED=13,
ATK_STATE_MODAL=14,
ATK_STATE_MULTI_LINE=15,
ATK_STATE_MULTISELECTABLE=16,
ATK_STATE_OPAQUE=17,
ATK_STATE_PRESSED=18,
ATK_STATE_RESIZABLE=19,
ATK_STATE_SELECTABLE=20,
ATK_STATE_SELECTED=21,
ATK_STATE_SENSITIVE=22,
ATK_STATE_SHOWING=23,
ATK_STATE_SINGLE_LINE=24,
ATK_STATE_STALE=25,
ATK_STATE_TRANSIENT=26,
ATK_STATE_VERTICAL=27,
ATK_STATE_VISIBLE=28,
ATK_STATE_MANAGES_DESCENDANTS=29,
ATK_STATE_INDETERMINATE=30,
ATK_STATE_TRUNCATED=31,
ATK_STATE_REQUIRED=32,
ATK_STATE_LAST_DEFINED=33,
}
extern (C) int atk_value_set_current_value(void *, _GValue *);
extern (C) void atk_value_get_minimum_value(void *, _GValue *);
extern (C) void atk_value_get_maximum_value(void *, _GValue *);
extern (C) void atk_value_get_current_value(void *, _GValue *);
extern (C) uint atk_value_get_type();
extern (C) int atk_table_remove_column_selection(void *, int);
extern (C) int atk_table_add_column_selection(void *, int);
extern (C) int atk_table_remove_row_selection(void *, int);
extern (C) int atk_table_add_row_selection(void *, int);
extern (C) int atk_table_is_selected(void *, int, int);
extern (C) int atk_table_is_row_selected(void *, int);
extern (C) int atk_table_is_column_selected(void *, int);
extern (C) int atk_table_get_selected_rows(void *, int * *);
extern (C) int atk_table_get_selected_columns(void *, int * *);
extern (C) void atk_table_set_summary(void *, _AtkObject *);
extern (C) void atk_table_set_row_header(void *, int, _AtkObject *);
extern (C) void atk_table_set_row_description(void *, int, char *);
extern (C) void atk_table_set_column_header(void *, int, _AtkObject *);
extern (C) void atk_table_set_column_description(void *, int, char *);
extern (C) void atk_table_set_caption(void *, _AtkObject *);
extern (C) _AtkObject * atk_table_get_summary(void *);
extern (C) _AtkObject * atk_table_get_row_header(void *, int);
extern (C) char * atk_table_get_row_description(void *, int);
extern (C) _AtkObject * atk_table_get_column_header(void *, int);
extern (C) char * atk_table_get_column_description(void *, int);
extern (C) _AtkObject * atk_table_get_caption(void *);
extern (C) int atk_table_get_row_extent_at(void *, int, int);
extern (C) int atk_table_get_column_extent_at(void *, int, int);
extern (C) int atk_table_get_n_rows(void *);
extern (C) int atk_table_get_n_columns(void *);
extern (C) int atk_table_get_row_at_index(void *, int);
extern (C) int atk_table_get_column_at_index(void *, int);
extern (C) int atk_table_get_index_at(void *, int, int);
extern (C) _AtkObject * atk_table_ref_at(void *, int, int);
extern (C) uint atk_table_get_type();
extern (C) _GIOChannel * atk_streamable_content_get_stream(void *, char *);
extern (C) char * atk_streamable_content_get_mime_type(void *, int);
extern (C) int atk_streamable_content_get_n_mime_types(void *);
extern (C) uint atk_streamable_content_get_type();
extern (C) _AtkStateSet * atk_state_set_xor_sets(_AtkStateSet *, _AtkStateSet *);
extern (C) _AtkStateSet * atk_state_set_or_sets(_AtkStateSet *, _AtkStateSet *);
extern (C) _AtkStateSet * atk_state_set_and_sets(_AtkStateSet *, _AtkStateSet *);
extern (C) int atk_state_set_remove_state(_AtkStateSet *, int);
extern (C) int atk_state_set_contains_states(_AtkStateSet *, int *, int);
extern (C) int atk_state_set_contains_state(_AtkStateSet *, int);
extern (C) void atk_state_set_clear_states(_AtkStateSet *);
extern (C) void atk_state_set_add_states(_AtkStateSet *, int *, int);
extern (C) int atk_state_set_add_state(_AtkStateSet *, int);
extern (C) int atk_state_set_is_empty(_AtkStateSet *);
extern (C) _AtkStateSet * atk_state_set_new();
extern (C) uint atk_state_set_get_type();
extern (C) int atk_selection_select_all_selection(void *);
extern (C) int atk_selection_remove_selection(void *, int);
extern (C) int atk_selection_is_child_selected(void *, int);
extern (C) int atk_selection_get_selection_count(void *);
extern (C) _AtkObject * atk_selection_ref_selection(void *, int);
extern (C) int atk_selection_clear_selection(void *);
extern (C) int atk_selection_add_selection(void *, int);
extern (C) uint atk_selection_get_type();
extern (C) void atk_relation_set_add_relation_by_type(_AtkRelationSet *, int, _AtkObject *);
extern (C) _AtkRelation * atk_relation_set_get_relation_by_type(_AtkRelationSet *, int);
extern (C) _AtkRelation * atk_relation_set_get_relation(_AtkRelationSet *, int);
extern (C) int atk_relation_set_get_n_relations(_AtkRelationSet *);
extern (C) void atk_relation_set_add(_AtkRelationSet *, _AtkRelation *);
extern (C) void atk_relation_set_remove(_AtkRelationSet *, _AtkRelation *);
extern (C) int atk_relation_set_contains(_AtkRelationSet *, int);
extern (C) _AtkRelationSet * atk_relation_set_new();
extern (C) uint atk_relation_set_get_type();
extern (C) void atk_relation_add_target(_AtkRelation *, _AtkObject *);
extern (C) _GPtrArray * atk_relation_get_target(_AtkRelation *);
extern (C) int atk_relation_get_relation_type(_AtkRelation *);
extern (C) _AtkRelation * atk_relation_new(_AtkObject * *, int, int);
extern (C) int atk_relation_type_for_name(char *);
extern (C) char * atk_relation_type_get_name(int);
extern (C) int atk_relation_type_register(char *);
extern (C) uint atk_relation_get_type();
extern (C) _AtkRegistry * atk_get_default_registry();
extern (C) _AtkObjectFactory * atk_registry_get_factory(_AtkRegistry *, uint);
extern (C) uint atk_registry_get_factory_type(_AtkRegistry *, uint);
extern (C) void atk_registry_set_factory_type(_AtkRegistry *, uint, uint);
extern (C) uint atk_registry_get_type();
extern (C) _AtkObjectFactory * atk_no_op_object_factory_new();
extern (C) uint atk_no_op_object_factory_get_type();
extern (C) uint atk_object_factory_get_accessible_type(_AtkObjectFactory *);
extern (C) void atk_object_factory_invalidate(_AtkObjectFactory *);
extern (C) _AtkObject * atk_object_factory_create_accessible(_AtkObjectFactory *, _GObject *);
extern (C) uint atk_object_factory_get_type();
extern (C) _AtkObject * atk_no_op_object_new(_GObject *);
extern (C) uint atk_no_op_object_get_type();
extern (C) void atk_image_get_image_position(void *, int *, int *, int);
extern (C) int atk_image_set_image_description(void *, char *);
extern (C) void atk_image_get_image_size(void *, int *, int *);
extern (C) char * atk_image_get_image_description(void *);
extern (C) uint atk_image_get_type();
extern (C) int atk_hypertext_get_link_index(void *, int);
extern (C) int atk_hypertext_get_n_links(void *);
extern (C) _AtkHyperlink * atk_hypertext_get_link(void *, int);
extern (C) uint atk_hypertext_get_type();
extern (C) int atk_hyperlink_is_selected_link(_AtkHyperlink *);
extern (C) int atk_hyperlink_get_n_anchors(_AtkHyperlink *);
extern (C) int atk_hyperlink_is_inline(_AtkHyperlink *);
extern (C) int atk_hyperlink_is_valid(_AtkHyperlink *);
extern (C) int atk_hyperlink_get_start_index(_AtkHyperlink *);
extern (C) int atk_hyperlink_get_end_index(_AtkHyperlink *);
extern (C) _AtkObject * atk_hyperlink_get_object(_AtkHyperlink *, int);
extern (C) char * atk_hyperlink_get_uri(_AtkHyperlink *, int);
extern (C) uint atk_hyperlink_get_type();
extern (C) _GObject * atk_gobject_accessible_get_object(_AtkGObjectAccessible *);
extern (C) _AtkObject * atk_gobject_accessible_for_object(_GObject *);
extern (C) uint atk_gobject_accessible_get_type();
extern (C) void atk_editable_text_paste_text(void *, int);
extern (C) void atk_editable_text_delete_text(void *, int, int);
extern (C) void atk_editable_text_cut_text(void *, int, int);
extern (C) void atk_editable_text_copy_text(void *, int, int);
extern (C) void atk_editable_text_insert_text(void *, char *, int, int *);
extern (C) void atk_editable_text_set_text_contents(void *, char *);
extern (C) int atk_editable_text_set_run_attributes(void *, _GSList *, int, int);
extern (C) uint atk_editable_text_get_type();
extern (C) char * atk_text_attribute_get_value(int, int);
extern (C) int atk_text_attribute_for_name(char *);
extern (C) char * atk_text_attribute_get_name(int);
extern (C) void atk_attribute_set_free(_GSList *);
extern (C) void atk_text_free_ranges(_AtkTextRange * *);
extern (C) _AtkTextRange * * atk_text_get_bounded_ranges(void *, _AtkTextRectangle *, int, int, int);
extern (C) void atk_text_get_range_extents(void *, int, int, int, _AtkTextRectangle *);
extern (C) int atk_text_set_caret_offset(void *, int);
extern (C) int atk_text_set_selection(void *, int, int, int);
extern (C) int atk_text_remove_selection(void *, int);
extern (C) int atk_text_add_selection(void *, int, int);
extern (C) char * atk_text_get_selection(void *, int, int *, int *);
extern (C) int atk_text_get_n_selections(void *);
extern (C) int atk_text_get_offset_at_point(void *, int, int, int);
extern (C) int atk_text_get_character_count(void *);
extern (C) _GSList * atk_text_get_default_attributes(void *);
extern (C) _GSList * atk_text_get_run_attributes(void *, int, int *, int *);
extern (C) void atk_text_get_character_extents(void *, int, int *, int *, int *, int *, int);
extern (C) int atk_text_get_caret_offset(void *);
extern (C) char * atk_text_get_text_before_offset(void *, int, int, int *, int *);
extern (C) char * atk_text_get_text_at_offset(void *, int, int, int *, int *);
extern (C) char * atk_text_get_text_after_offset(void *, int, int, int *, int *);
extern (C) uint atk_text_get_character_at_offset(void *, int);
extern (C) char * atk_text_get_text(void *, int, int);
extern (C) uint atk_text_get_type();
extern (C) int atk_text_attribute_register(char *);
extern (C) void * atk_document_get_document(void *);
extern (C) char * atk_document_get_document_type(void *);
extern (C) uint atk_document_get_type();
extern (C) int atk_component_set_size(void *, int, int);
extern (C) int atk_component_set_position(void *, int, int, int);
extern (C) int atk_component_set_extents(void *, int, int, int, int, int);
extern (C) void atk_component_remove_focus_handler(void *, uint);
extern (C) int atk_component_grab_focus(void *);
extern (C) int atk_component_get_mdi_zorder(void *);
extern (C) int atk_component_get_layer(void *);
extern (C) void atk_component_get_size(void *, int *, int *);
extern (C) void atk_component_get_position(void *, int *, int *, int);
extern (C) void atk_component_get_extents(void *, int *, int *, int *, int *, int);
extern (C) _AtkObject * atk_component_ref_accessible_at_point(void *, int, int, int);
extern (C) int atk_component_contains(void *, int, int, int);
extern (C) uint atk_component_add_focus_handler(void *, _BCD_func__2391);
extern (C) uint atk_component_get_type();
extern (C) uint atk_rectangle_get_type();
extern (C) char * atk_get_toolkit_version();
extern (C) char * atk_get_toolkit_name();
extern (C) _AtkObject * atk_get_focus_object();
extern (C) _AtkObject * atk_get_root();
extern (C) void atk_remove_key_event_listener(uint);
extern (C) uint atk_add_key_event_listener(_BCD_func__2410, void *);
extern (C) void atk_remove_global_event_listener(uint);
extern (C) uint atk_add_global_event_listener(_BCD_func__2697, char *);
extern (C) void atk_focus_tracker_notify(_AtkObject *);
extern (C) void atk_focus_tracker_init(_BCD_func__2411);
extern (C) void atk_remove_focus_tracker(uint);
extern (C) uint atk_add_focus_tracker(_BCD_func__2412);
extern (C) uint atk_util_get_type();
extern (C) char * atk_action_get_localized_name(void *, int);
extern (C) int atk_action_set_description(void *, int, char *);
extern (C) char * atk_action_get_keybinding(void *, int);
extern (C) char * atk_action_get_name(void *, int);
extern (C) char * atk_action_get_description(void *, int);
extern (C) int atk_action_get_n_actions(void *);
extern (C) int atk_action_do_action(void *, int);
extern (C) uint atk_action_get_type();
extern (C) char * atk_role_get_localized_name(int);
extern (C) int atk_object_remove_relationship(_AtkObject *, int, _AtkObject *);
extern (C) int atk_object_add_relationship(_AtkObject *, int, _AtkObject *);
extern (C) int atk_role_for_name(char *);
extern (C) char * atk_role_get_name(int);
extern (C) void atk_object_initialize(_AtkObject *, void *);
extern (C) void atk_object_notify_state_change(_AtkObject *, ulong, int);
extern (C) void atk_object_remove_property_change_handler(_AtkObject *, uint);
extern (C) uint atk_object_connect_property_change_handler(_AtkObject *, _BCD_func__2449 *);
extern (C) void atk_object_set_role(_AtkObject *, int);
extern (C) void atk_object_set_parent(_AtkObject *, _AtkObject *);
extern (C) void atk_object_set_description(_AtkObject *, char *);
extern (C) void atk_object_set_name(_AtkObject *, char *);
extern (C) int atk_object_get_index_in_parent(_AtkObject *);
extern (C) _AtkStateSet * atk_object_ref_state_set(_AtkObject *);
extern (C) int atk_object_get_mdi_zorder(_AtkObject *);
extern (C) int atk_object_get_layer(_AtkObject *);
extern (C) int atk_object_get_role(_AtkObject *);
extern (C) _AtkRelationSet * atk_object_ref_relation_set(_AtkObject *);
extern (C) _AtkObject * atk_object_ref_accessible_child(_AtkObject *, int);
extern (C) int atk_object_get_n_accessible_children(_AtkObject *);
extern (C) _AtkObject * atk_object_get_parent(_AtkObject *);
extern (C) char * atk_object_get_description(_AtkObject *);
extern (C) char * atk_object_get_name(_AtkObject *);
extern (C) _AtkObject * atk_implementor_ref_accessible(void *);
extern (C) uint atk_implementor_get_type();
extern (C) uint atk_object_get_type();
extern (C) int atk_role_register(char *);
extern (C) int atk_state_type_for_name(char *);
extern (C) char * atk_state_type_get_name(int);
extern (C) int atk_state_type_register(char *);
alias void function(void *, uint, uint, _GInterfaceInfo *) _BCD_func__2517;
alias void function(void *, uint, _GTypeInfo *, _GTypeValueTable *) _BCD_func__2518;
alias void function(void *) _BCD_func__2519;
alias void function(void *, _GObject *, int) _BCD_func__2662;
alias void function(void *, _GObject *) _BCD_func__2668;
alias void function(_GObject *) _BCD_func__2669;
alias void function(_GObject *, uint, _GValue *, _GParamSpec *) _BCD_func__2670;
alias void function(_GObject *, uint, _GValue *, _GParamSpec *) _BCD_func__2671;
alias int function(_GSignalInvocationHint *, _GValue *, _GValue *, void *) _BCD_func__2696;
alias void function(_GClosure *, _GValue *, uint, _GValue *, void *, void *) _BCD_func__2698;
alias void function(void *, _GClosure *) _BCD_func__2717;
alias void function(_GValue *, _GValue *) _BCD_func__2775;
alias void function(void *) _BCD_func__2803;
alias void * function(void *) _BCD_func__2804;
alias void function(void *, void *) _BCD_func__2808;
alias int function(void *, _GTypeClass *) _BCD_func__2809;
alias void function(_GTypeInstance *, void *) _BCD_func__2810;
alias int function(void *, void *, void *) _BCD_func__2864;
alias void function(_GScanner *, char *, int) _BCD_func__2882;
alias void function(void *, void *, void *, _GError * *) _BCD_func__2966;
alias int function(void *, void *, void *, _GError * *) _BCD_func__2967;
alias int function(char *, char *, void *, _GError * *) _BCD_func__2968;
alias void * function(void *, void *) _BCD_func__2980;
alias void function(_GNode *, void *) _BCD_func__2981;
alias int function(_GNode *, void *) _BCD_func__2982;
alias void function(char *) _BCD_func__2990;
alias void function(char *, int, char *, void *) _BCD_func__2992;
alias int function(_GIOChannel *, int, void *) _BCD_func__3009;
alias int function(_GPollFD *, uint, int) _BCD_func__3074;
alias void function(int, int, void *) _BCD_func__3080;
alias void function(_GHookList *, _GHook *) _BCD_func__3112;
alias int function(_GHook *, void *) _BCD_func__3113;
alias void function(_GHook *, void *) _BCD_func__3114;
alias int function(_GHook *, _GHook *) _BCD_func__3115;
alias void function(uint, void *, void *) _BCD_func__3149;
alias int function(char *, char *, uint) _BCD_func__3152;
alias char * function(void *) _BCD_func__3153;
alias char * function(char *, void *) _BCD_func__3273;
alias void function(void *, void *, void *) _BCD_func__3274;
alias uint function(void *) _BCD_func__3275;
alias int function(void *, void *) _BCD_func__3276;
alias int function(void *, void *, void *) _BCD_func__3277;
alias int function(void *, void *) _BCD_func__3278;
struct _AtkValueIface {
_GTypeInterface parent;
_BCD_func__3648 get_current_value;
_BCD_func__3648 get_maximum_value;
_BCD_func__3648 get_minimum_value;
_BCD_func__3649 set_current_value;
_BCD_func__2450 pad1;
_BCD_func__2450 pad2;
}
struct _AtkTableIface {
_GTypeInterface parent;
_BCD_func__3651 ref_at;
_BCD_func__3652 get_index_at;
_BCD_func__3653 get_column_at_index;
_BCD_func__3653 get_row_at_index;
_BCD_func__3654 get_n_columns;
_BCD_func__3654 get_n_rows;
_BCD_func__3652 get_column_extent_at;
_BCD_func__3652 get_row_extent_at;
_BCD_func__3655 get_caption;
_BCD_func__3656 get_column_description;
_BCD_func__3657 get_column_header;
_BCD_func__3656 get_row_description;
_BCD_func__3657 get_row_header;
_BCD_func__3655 get_summary;
_BCD_func__3658 set_caption;
_BCD_func__3659 set_column_description;
_BCD_func__3660 set_column_header;
_BCD_func__3659 set_row_description;
_BCD_func__3660 set_row_header;
_BCD_func__3658 set_summary;
_BCD_func__3661 get_selected_columns;
_BCD_func__3661 get_selected_rows;
_BCD_func__3662 is_column_selected;
_BCD_func__3662 is_row_selected;
_BCD_func__3663 is_selected;
_BCD_func__3662 add_row_selection;
_BCD_func__3662 remove_row_selection;
_BCD_func__3662 add_column_selection;
_BCD_func__3662 remove_column_selection;
_BCD_func__3664 row_inserted;
_BCD_func__3664 column_inserted;
_BCD_func__3664 row_deleted;
_BCD_func__3664 column_deleted;
_BCD_func__3665 row_reordered;
_BCD_func__3665 column_reordered;
_BCD_func__3665 model_changed;
_BCD_func__2450 pad1;
_BCD_func__2450 pad2;
_BCD_func__2450 pad3;
_BCD_func__2450 pad4;
}
struct _AtkStreamableContentIface {
_GTypeInterface parent;
_BCD_func__3667 get_n_mime_types;
_BCD_func__3668 get_mime_type;
_BCD_func__3669 get_stream;
_BCD_func__2450 pad1;
_BCD_func__2450 pad2;
_BCD_func__2450 pad3;
_BCD_func__2450 pad4;
}
struct _AtkStateSetClass {
_GObjectClass parent;
}
struct _AtkSelectionIface {
_GTypeInterface parent;
_BCD_func__3672 add_selection;
_BCD_func__3673 clear_selection;
_BCD_func__3674 ref_selection;
_BCD_func__3675 get_selection_count;
_BCD_func__3672 is_child_selected;
_BCD_func__3672 remove_selection;
_BCD_func__3673 select_all_selection;
_BCD_func__3676 selection_changed;
_BCD_func__2450 pad1;
_BCD_func__2450 pad2;
}
struct _AtkRelationSetClass {
_GObjectClass parent;
_BCD_func__2450 pad1;
_BCD_func__2450 pad2;
}
struct _AtkRelationClass {
_GObjectClass parent;
}
struct _AtkRelation {
_GObject parent;
_GPtrArray * target;
int relationship;
}
struct _AtkRegistryClass {
_GObjectClass parent_class;
}
struct _AtkRegistry {
_GObject parent;
void * factory_type_registry;
void * factory_singleton_cache;
}
struct _AtkNoOpObjectFactoryClass {
_AtkObjectFactoryClass parent_class;
}
struct _AtkNoOpObjectFactory {
_AtkObjectFactory parent;
}
struct _AtkObjectFactoryClass {
_GObjectClass parent_class;
_BCD_func__3685 create_accessible;
_BCD_func__3686 invalidate;
_BCD_func__3687 get_accessible_type;
_BCD_func__2450 pad1;
_BCD_func__2450 pad2;
}
struct _AtkObjectFactory {
_GObject parent;
}
struct _AtkNoOpObjectClass {
_AtkObjectClass parent_class;
}
struct _AtkNoOpObject {
_AtkObject parent;
}
struct _AtkImageIface {
_GTypeInterface parent;
_BCD_func__3692 get_image_position;
_BCD_func__3693 get_image_description;
_BCD_func__3694 get_image_size;
_BCD_func__3695 set_image_description;
_BCD_func__2450 pad1;
_BCD_func__2450 pad2;
}
struct _AtkHypertextIface {
_GTypeInterface parent;
_BCD_func__3697 get_link;
_BCD_func__3698 get_n_links;
_BCD_func__3699 get_link_index;
_BCD_func__3700 link_selected;
_BCD_func__2450 pad1;
_BCD_func__2450 pad2;
_BCD_func__2450 pad3;
}
struct _AtkHyperlinkClass {
_GObjectClass parent;
_BCD_func__3702 get_uri;
_BCD_func__3703 get_object;
_BCD_func__3704 get_end_index;
_BCD_func__3704 get_start_index;
_BCD_func__3705 is_valid;
_BCD_func__3704 get_n_anchors;
_BCD_func__3706 link_state;
_BCD_func__3705 is_selected_link;
_BCD_func__3707 link_activated;
_BCD_func__2450 pad1;
}
struct _AtkHyperlink {
_GObject parent;
}
struct _AtkGObjectAccessibleClass {
_AtkObjectClass parent_class;
_BCD_func__2450 pad1;
_BCD_func__2450 pad2;
}
struct _AtkGObjectAccessible {
_AtkObject parent;
}
struct _AtkEditableTextIface {
_GTypeInterface parent_interface;
_BCD_func__3712 set_run_attributes;
_BCD_func__3713 set_text_contents;
_BCD_func__3714 insert_text;
_BCD_func__3715 copy_text;
_BCD_func__3715 cut_text;
_BCD_func__3715 delete_text;
_BCD_func__3716 paste_text;
_BCD_func__2450 pad1;
_BCD_func__2450 pad2;
}
struct _AtkTextRange {
_AtkTextRectangle bounds;
int start_offset;
int end_offset;
char * content;
}
struct _AtkTextRectangle {
int x;
int y;
int width;
int height;
}
struct _AtkTextIface {
_GTypeInterface parent;
_BCD_func__3720 get_text;
_BCD_func__3721 get_text_after_offset;
_BCD_func__3721 get_text_at_offset;
_BCD_func__3722 get_character_at_offset;
_BCD_func__3721 get_text_before_offset;
_BCD_func__3723 get_caret_offset;
_BCD_func__3724 get_run_attributes;
_BCD_func__3725 get_default_attributes;
_BCD_func__3726 get_character_extents;
_BCD_func__3723 get_character_count;
_BCD_func__3727 get_offset_at_point;
_BCD_func__3723 get_n_selections;
_BCD_func__3728 get_selection;
_BCD_func__3729 add_selection;
_BCD_func__3730 remove_selection;
_BCD_func__3731 set_selection;
_BCD_func__3730 set_caret_offset;
_BCD_func__3732 text_changed;
_BCD_func__3733 text_caret_moved;
_BCD_func__3734 text_selection_changed;
_BCD_func__3734 text_attributes_changed;
_BCD_func__3735 get_range_extents;
_BCD_func__3736 get_bounded_ranges;
_BCD_func__2450 pad4;
}
struct _AtkAttribute {
char * name;
char * value;
}
struct _AtkDocumentIface {
_GTypeInterface parent;
_BCD_func__3740 get_document_type;
_BCD_func__3741 get_document;
_BCD_func__2450 pad1;
_BCD_func__2450 pad2;
_BCD_func__2450 pad3;
_BCD_func__2450 pad4;
_BCD_func__2450 pad5;
_BCD_func__2450 pad6;
_BCD_func__2450 pad7;
_BCD_func__2450 pad8;
}
struct _AtkRectangle {
int x;
int y;
int width;
int height;
}
struct _AtkComponentIface {
_GTypeInterface parent;
_BCD_func__3744 add_focus_handler;
_BCD_func__3745 contains;
_BCD_func__3746 ref_accessible_at_point;
_BCD_func__3747 get_extents;
_BCD_func__3748 get_position;
_BCD_func__3749 get_size;
_BCD_func__3750 grab_focus;
_BCD_func__3751 remove_focus_handler;
_BCD_func__3752 set_extents;
_BCD_func__3745 set_position;
_BCD_func__3753 set_size;
_BCD_func__3754 get_layer;
_BCD_func__3755 get_mdi_zorder;
_BCD_func__3756 bounds_changed;
_BCD_func__2450 pad2;
}
struct _AtkKeyEventStruct {
int type;
uint state;
uint keyval;
int length;
char * string;
ushort keycode;
uint timestamp;
}
struct _AtkUtilClass {
_GObjectClass parent;
_BCD_func__3759 add_global_event_listener;
_BCD_func__3760 remove_global_event_listener;
_BCD_func__3761 add_key_event_listener;
_BCD_func__3760 remove_key_event_listener;
_BCD_func__3762 get_root;
_BCD_func__3763 get_toolkit_name;
_BCD_func__3763 get_toolkit_version;
}
struct _AtkUtil {
_GObject parent;
}
struct _AtkActionIface {
_GTypeInterface parent;
_BCD_func__3766 do_action;
_BCD_func__3767 get_n_actions;
_BCD_func__3768 get_description;
_BCD_func__3768 get_name;
_BCD_func__3768 get_keybinding;
_BCD_func__3769 set_description;
_BCD_func__3768 get_localized_name;
_BCD_func__2450 pad2;
}
struct _AtkPropertyValues {
char * property_name;
_GValue old_value;
_GValue new_value;
}
struct _AtkStateSet {
_GObject parent;
}
struct _AtkRelationSet {
_GObject parent;
_GPtrArray * relations;
}
struct _AtkObjectClass {
_GObjectClass parent;
_BCD_func__3774 get_name;
_BCD_func__3774 get_description;
_BCD_func__3775 get_parent;
_BCD_func__3776 get_n_children;
_BCD_func__3777 ref_child;
_BCD_func__3776 get_index_in_parent;
_BCD_func__3778 ref_relation_set;
_BCD_func__3779 get_role;
_BCD_func__3780 get_layer;
_BCD_func__3776 get_mdi_zorder;
_BCD_func__3781 ref_state_set;
_BCD_func__3782 set_name;
_BCD_func__3782 set_description;
_BCD_func__3783 set_parent;
_BCD_func__3784 set_role;
_BCD_func__3785 connect_property_change_handler;
_BCD_func__3786 remove_property_change_handler;
_BCD_func__3787 initialize;
_BCD_func__3788 children_changed;
_BCD_func__2391 focus_event;
_BCD_func__2449 property_change;
_BCD_func__3789 state_change;
_BCD_func__2412 visible_data_changed;
_BCD_func__3790 active_descendant_changed;
_BCD_func__2450 pad1;
_BCD_func__2450 pad2;
_BCD_func__2450 pad3;
}
struct _AtkObject {
_GObject parent;
char * description;
char * name;
_AtkObject * accessible_parent;
int role;
_AtkRelationSet * relation_set;
int layer;
}
struct _AtkImplementorIface {
_GTypeInterface parent;
_BCD_func__3793 ref_accessible;
}
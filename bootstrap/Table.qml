import Silk.HTML 5.0 as HTML

HTML.Table {
    _class: 'table'
            + (__striped ? ' table-striped' : '')
            + (__hover ? ' table-hover' : '')
            + (__bordered ? ' table-bordered' : '')
            + (__condensed ? ' table-condensed' : '')

    property bool __striped: false
    property bool __hover: false
    property bool __bordered: false
    property bool __condensed: false
}

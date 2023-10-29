// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:example/components/ui/alert/widgetbook.dart' as _i2;
import 'package:example/components/ui/button/widgetbook.dart' as _i3;
import 'package:example/components/ui/elements/widgetbook.dart' as _i4;
import 'package:example/components/ui/input/widgetbook.dart' as _i5;
import 'package:example/components/ui/tabs/widgetbook.dart' as _i6;
import 'package:example/components/ui/toggle/widgetbook.dart' as _i7;
import 'package:konstant_ui/impl/components/ui/alert/widgetbook.dart' as _i8;
import 'package:konstant_ui/impl/components/ui/button/widgetbook.dart' as _i9;
import 'package:konstant_ui/impl/components/ui/elements/widgetbook.dart'
    as _i10;
import 'package:konstant_ui/impl/components/ui/input/widgetbook.dart' as _i11;
import 'package:konstant_ui/impl/components/ui/tabs/widgetbook.dart' as _i12;
import 'package:konstant_ui/impl/components/ui/toggle/widgetbook.dart' as _i13;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'components',
    children: [
      _i1.WidgetbookFolder(
        name: 'ui',
        children: [
          _i1.WidgetbookFolder(
            name: 'alert',
            children: [
              _i1.WidgetbookComponent(
                name: 'UIAlert',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'default',
                    builder: _i2.useCase,
                  )
                ],
              )
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'button',
            children: [
              _i1.WidgetbookComponent(
                name: 'UIButton',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'default',
                    builder: _i3.greenContainerUseCase,
                  )
                ],
              )
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'elements',
            children: [
              _i1.WidgetbookComponent(
                name: 'Skeleton',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'default',
                    builder: _i4.useCase,
                  )
                ],
              ),
              _i1.WidgetbookComponent(
                name: 'UIIcon',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'default',
                    builder: _i4.iconCase,
                  )
                ],
              ),
              _i1.WidgetbookComponent(
                name: 'UISpinner',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'default',
                    builder: _i4.spinnerCase,
                  )
                ],
              ),
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'input',
            children: [
              _i1.WidgetbookComponent(
                name: 'UIInput',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'default',
                    builder: _i5.greenContainerUseCase,
                  )
                ],
              )
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'tabs',
            children: [
              _i1.WidgetbookComponent(
                name: 'UITabs',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'default',
                    builder: _i6.greenContainerUseCase,
                  )
                ],
              )
            ],
          ),
          _i1.WidgetbookFolder(
            name: 'toggle',
            children: [
              _i1.WidgetbookComponent(
                name: 'UIToggleButton',
                useCases: [
                  _i1.WidgetbookUseCase(
                    name: 'default',
                    builder: _i7.greenContainerUseCase,
                  )
                ],
              )
            ],
          ),
        ],
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'impl',
    children: [
      _i1.WidgetbookFolder(
        name: 'components',
        children: [
          _i1.WidgetbookFolder(
            name: 'ui',
            children: [
              _i1.WidgetbookFolder(
                name: 'alert',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'UIAlert',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'default',
                        builder: _i8.useCase,
                      )
                    ],
                  )
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'button',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'UIButton',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'default',
                        builder: _i9.greenContainerUseCase,
                      )
                    ],
                  )
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'elements',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'Skeleton',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'default',
                        builder: _i10.useCase,
                      )
                    ],
                  ),
                  _i1.WidgetbookComponent(
                    name: 'UIIcon',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'default',
                        builder: _i10.iconCase,
                      )
                    ],
                  ),
                  _i1.WidgetbookComponent(
                    name: 'UISpinner',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'default',
                        builder: _i10.spinnerCase,
                      )
                    ],
                  ),
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'input',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'UIInput',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'default',
                        builder: _i11.greenContainerUseCase,
                      )
                    ],
                  )
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'tabs',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'UITabs',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'default',
                        builder: _i12.greenContainerUseCase,
                      )
                    ],
                  )
                ],
              ),
              _i1.WidgetbookFolder(
                name: 'toggle',
                children: [
                  _i1.WidgetbookComponent(
                    name: 'UIToggleButton',
                    useCases: [
                      _i1.WidgetbookUseCase(
                        name: 'default',
                        builder: _i13.greenContainerUseCase,
                      )
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      )
    ],
  ),
];

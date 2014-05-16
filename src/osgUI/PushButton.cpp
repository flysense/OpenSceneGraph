/* -*-c++-*- OpenSceneGraph - Copyright (C) 1998-2014 Robert Osfield
 *
 * This library is open source and may be redistributed and/or modified under
 * the terms of the OpenSceneGraph Public License (OSGPL) version 0.0 or
 * (at your option) any later version.  The full license is in LICENSE file
 * included with this distribution, and on the openscenegraph.org website.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * OpenSceneGraph Public License for more details.
*/


#include <osgUI/PushButton>
#include <osgText/String>
#include <osgText/Font>
#include <osgText/Text>
#include <osg/Notify>

using namespace osgUI;

PushButton::PushButton()
{
}

PushButton::PushButton(const osgUI::PushButton& label, const osg::CopyOp& copyop):
    Widget(label, copyop),
    _text(label._text)
{
}

bool PushButton::handleImplementation(osgGA::EventVisitor* ev, osgGA::Event* event)
{
    OSG_NOTICE<<"PushButton::handleImplementation"<<std::endl;

    osgGA::GUIEventAdapter* ea = event->asGUIEventAdapter();
    if (!ea) return false;

    switch(ea->getEventType())
    {
        case(osgGA::GUIEventAdapter::PUSH):
            OSG_NOTICE<<"Button pressed "<<std::endl;
            if (_buttonSwitch.valid()) _buttonSwitch->setSingleChildOn(2);
            break;
        case(osgGA::GUIEventAdapter::RELEASE):
            OSG_NOTICE<<"Button release "<<std::endl;
            if (_buttonSwitch.valid()) _buttonSwitch->setSingleChildOn(1);
            break;
        default:
            break;
    }

    return false;
}

void PushButton::enterImplementation()
{
    OSG_NOTICE<<"PushButton enter"<<std::endl;
    if (_buttonSwitch.valid()) _buttonSwitch->setSingleChildOn(1);
}


void PushButton::leaveImplementation()
{
    OSG_NOTICE<<"PushButton leave"<<std::endl;
    if (_buttonSwitch.valid()) _buttonSwitch->setSingleChildOn(0);
}

void PushButton::createGraphicsImplementation()
{

    if (_textDrawable.valid())
    {
        OSG_NOTICE<<"PushButton::createGraphicsImplementation() updating existing TextDrawable"<<std::endl;
        _textDrawable->setText(_text);
        _graphicsInitialized = true;
    }
    else
    {
        OSG_NOTICE<<"PushButton::createGraphicsImplementation()"<<std::endl;

        Widget::createGraphicsImplementation();

        Style* style = (getStyle()!=0) ? getStyle() : Style::instance().get();
        osg::ref_ptr<Node> node = style->createText(_extents, getAlignmentSettings(), getTextSettings(), _text);
        _textDrawable = dynamic_cast<osgText::Text*>(node.get());
        _textDrawable->setDataVariance(osg::Object::DYNAMIC);

        addChild(_textDrawable.get());

        _buttonSwitch = new osg::Switch;

        float unFocused = 0.7;
        float withFocus = 0.8;
        float pressed = 0.5;

        _buttonSwitch->addChild(style->createPanel(_extents, osg::Vec4(unFocused, unFocused,unFocused, 1.0)));
        _buttonSwitch->addChild(style->createPanel(_extents, osg::Vec4(withFocus,withFocus,withFocus,1.0)));
        _buttonSwitch->addChild(style->createPanel(_extents, osg::Vec4(pressed,pressed,pressed,1.0)));
        _buttonSwitch->setSingleChildOn(0);

        addChild(_buttonSwitch.get());

    }
}
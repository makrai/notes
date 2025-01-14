Focal Loss for Dense Object Detection
Tsung-Yi Lin, Priya Goyal, Ross Girshick, Kaiming He, Piotr Dollar;
IEEE International Conference on Computer Vision (ICCV), 2017, pp 2980-2988

# Abstract

* SOTA object detectors are based on a two-stage approach popularized by R-CNN,
  * a classifier is applied to a sparse set of candidate object locations
* one-stage detectors that are
  * applied over a regular, dense sampling of possible object locations
  * potential to be faster and simpler, but have
  * trailed [nyomában kullog] the accuracy of two-stage detectors thus far
* we investigate why this is the case. We discover that the
  * extreme foreground-background class imbalance
    encountered during training of dense detectors <~ the central cause
  * we reshape the standard cross entropy loss such that it
    down-weights the loss assigned to well-classified examples
  * Our novel Focal Loss focuses training on a sparse set of hard examples and
    prevents the vast number of easy negatives from overwhelming the detector
* we: a simple dense detector called RetinaNet
* results show that when trained with the focal loss, RetinaNet is able to
  * match the speed of previous one-stage detectors while
  * surpassing the accuracy of all existing SOTA two-stage detectors
